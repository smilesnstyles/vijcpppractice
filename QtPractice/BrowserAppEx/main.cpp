#include "MyBrowser.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QWebSettings *webSettings = QWebSettings::globalSettings();

    webSettings->setAttribute(QWebSettings::AutoLoadImages,true);
    webSettings->setAttribute(QWebSettings::JavascriptEnabled,true);
    webSettings->setAttribute(QWebSettings::PluginsEnabled,true);

    webSettings->setAttribute(QWebSettings::ZoomTextOnly,true);

    webSettings->setAttribute(QWebSettings::DeveloperExtrasEnabled,true);

    MyBrowser w;
    w.show();

    return app.exec();
}
