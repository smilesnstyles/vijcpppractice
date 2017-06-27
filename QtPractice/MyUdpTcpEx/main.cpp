#include <QCoreApplication>
#include "myudptcp.h"
#include <QTimer>
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    myudptcp client;

    QTimer::singleShot(2000,&client,SLOT(HeloUDP()));
    client.doConnect();

    return a.exec();
}
