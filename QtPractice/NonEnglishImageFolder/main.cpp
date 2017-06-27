#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQmlContext>
#include <MySingletonClass.h>
#include <MyController.h>
#include <mylistmodal.h>

MySingletonClass *pMySingletonClass = NULL;
MyListModal *myListModel = NULL;

static QObject *mysingleton_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    if(pMySingletonClass == NULL)
    {
        pMySingletonClass = new MySingletonClass();
    }
    return pMySingletonClass;
}

static QObject *mylistmodel_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    if(myListModel == NULL)
    {
        QStringList stringList ;
        stringList << QObject::tr("vijay1") << QObject::tr("vijay2") << QObject::tr("vijay3");
        myListModel = new MyListModal(stringList);
    }

    return myListModel;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

//    pMySingletonClass = new MySingletonClass();

//    MyController *pMyController = new MyController(pMySingletonClass);

//    qmlRegisterSingletonType<MySingletonClass>("com.harman.MySingletonClass", 1, 0, "MySTObj", mysingleton_provider);

    qmlRegisterSingletonType<MyListModal>("com.harman.MyListModal", 1, 0, "MyListModal", mylistmodel_provider);

    QQmlApplicationEngine engine;

    QQmlComponent component(&engine,QUrl(QStringLiteral("qrc:/main.qml")));

    QObject *root = component.create();

    QObject* myImage = root->findChild<QObject*>("myImage");
    if(myImage)
    {
        myImage->setProperty("source",QString("file:///C:/QtPractice/build-NonEnglishImageFolder-Desktop_Qt_5_4_2_MinGW_32bit-Debug/debug/radüäassdöwßfs/Desert.jpg"));
    }

    QQmlApplicationEngine engine1;

    QQmlComponent component1(&engine1,QUrl(QStringLiteral("qrc:/main.qml")));

    QObject *root1 = component1.create();

    QObject* myImage1 = root1->findChild<QObject*>("myImage");
    if(myImage1)
    {
        myImage1->setProperty("source",QString("file:///C:/QtPractice/build-NonEnglishImageFolder-Desktop_Qt_5_4_2_MinGW_32bit-Debug/debug/radüäassdöwßfs/Desert.jpg"));
    }

//    QObject *myProp = root->findChild<QObject*>("myProp");
//    if(myProp)
//    {
//        myProp->setProperty("name","Anuroop");
//    }

//    pMyController->startMyTimer();

    return app.exec();
}
