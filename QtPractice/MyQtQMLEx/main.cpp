#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include "MyClass.h"
#include "MyQmlItem.h"
#include <QtQml>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    qmlRegisterType<MyClass>("MyClass", 2,8,"MyClass");
    qmlRegisterType<MyQmlItem>("MyQmlItem",1,1,"MyQmlItem");
    viewer.setMainQmlFile(QStringLiteral("qml/MyQtQMLEx/main.qml"));
    viewer.showExpanded();
    qRegisterMetaType<MyEnums>("MyEnums");

    MyClass am;
    QObject::connect(&am,SIGNAL(myageChanged(int)),&am,SLOT(helloage(int)));

    const QMetaObject *obj = am.metaObject();
    int count = obj->propertyCount();
    for(int i=0;i < count;i++)
    {
        QMetaProperty pro = obj->property(i);
        const char *name = pro.name();
        QVariant value  = am.property(name);
        qDebug() << name << " : " << value;
    }

    am.setmyage(689);

    viewer.rootContext()->setContextProperty("MyObj",&am);

    return app.exec();
}
