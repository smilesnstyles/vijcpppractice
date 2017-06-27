#include "mymobilityalert.h"
#include <QApplication>
#include <QNetworkProxyFactory>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setApplicationName(app.translate("main","MyMobiityAlert"));
    app.setOrganizationName("Vijkia");
    app.setOrganizationDomain("vijkia.com");
    app.setQuitOnLastWindowClosed(false);

    QNetworkProxyFactory::setUseSystemConfiguration(true);

    MyMobiityAlert w;
    w.show();

    return app.exec();
}
