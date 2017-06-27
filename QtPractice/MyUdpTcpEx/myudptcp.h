#ifndef MYUDPTCP_H
#define MYUDPTCP_H

#include <QObject>
#include <QUdpSocket>
#include <QTcpSocket>

class myudptcp : public QObject
{
    Q_OBJECT
public:
    myudptcp();

public slots:
    void readReady();
    void HeloUDP();
    void doConnect();

private:
    QUdpSocket *m_pUdpSocket;
    QTcpSocket *m_pTcpSocket;
};

#endif // MYUDPTCP_H
