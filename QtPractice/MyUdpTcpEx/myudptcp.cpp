#include "myudptcp.h"

myudptcp::myudptcp()
{
    m_pUdpSocket = new QUdpSocket(this);

    m_pUdpSocket->bind(QHostAddress::LocalHost,1234);

    connect(m_pUdpSocket,SIGNAL(readyRead()),this,SLOT(readReady()));

    m_pTcpSocket = new QTcpSocket(this);

}

void myudptcp::HeloUDP()
{
    QByteArray data;
    data.append("Hello UDP!");

    m_pUdpSocket->writeDatagram(data,QHostAddress::LocalHost,1234);
}

void myudptcp::doConnect()
{
    m_pTcpSocket->connectToHost("google.com",80);

    if(m_pTcpSocket->waitForConnected(5000))
    {
        qDebug() << "connected";

        m_pTcpSocket->write("hello server\r\n\r\n");
        m_pTcpSocket->waitForBytesWritten(1000);
        m_pTcpSocket->waitForReadyRead(3000);

        qDebug() << "Reading " << m_pTcpSocket->bytesAvailable();

        qDebug() << m_pTcpSocket->readAll();

        m_pTcpSocket->close();
    }
}

void myudptcp::readReady()
{
    QByteArray data;
    data.resize(m_pUdpSocket->pendingDatagramSize());
    QHostAddress addr;
    quint16 port;

    m_pUdpSocket->readDatagram(data.data(),data.size(),&addr,&port);

    qDebug() << "Message From : " << addr.toString();
    qDebug() << "Message From : " << port;
    qDebug() << "Message is : " << data;
}
