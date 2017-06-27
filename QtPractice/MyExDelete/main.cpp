#include "qtquick1applicationviewer.h"
#include <QApplication>
#include <QTime>
#include <QElapsedTimer>
#include <QDebug>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qDebug() << "Intial time : " << QTime::currentTime();
    QElapsedTimer timer;
    timer.start();

    QtQuick1ApplicationViewer viewer;
    viewer.addImportPath(QLatin1String("modules"));
    viewer.setOrientation(QtQuick1ApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("file:///C:/QtPractice/MyExDelete/main.qml"));
    viewer.showExpanded();

    qDebug() << "Elaped time : " << timer.elapsed() << endl;
    qDebug() << "Final time : " << QTime::currentTime();
    return app.exec();
}
