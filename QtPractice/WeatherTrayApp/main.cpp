#include "Weather.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    app.setApplicationName(app.translate("main","MyWeather"));
    app.setOrganizationName("Vijkia");
    app.setOrganizationDomain("vijkia.com");
   // app.setQuitOnLastWindowClosed(false);

    QNetworkProxyFactory::setUseSystemConfiguration(true);

    Weather w;
    w.show();

    return app.exec();
}
