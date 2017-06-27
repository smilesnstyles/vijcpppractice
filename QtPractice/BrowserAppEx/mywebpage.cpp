#include "mywebpage.h"
#include <QtUiTools>

#include <QPushButton>
#include <QRadioButton>

MyWebPage::MyWebPage(QUrl aUrl) :
    QWebPage()
{
    Q_UNUSED(aUrl);
    mainFrame()->setUrl(QUrl("file:///C:/QtPractice/build-WeatherTrayApp-Desktop_Qt_5_1_1_MinGW_32bit-Debug/myhtml.html"));
}

void MyWebPage::btnQtHello()
{
    qDebug() << "Qt Hello called";
}

QObject* MyWebPage::createPlugin(const QString &classid, const QUrl &url, const QStringList &paramNames, const QStringList &paramValues)
{
    if(url.isEmpty())
    {

    }
    QUiLoader loader;
    QWidget *widget = loader.createWidget(classid,view());

    qDebug() << "The Plugin Called " << classid << " is created and given to webpage" ;
    if(widget)
    {
        int index = paramNames.indexOf("width");
        if(index > -1)
        {
            widget->setMinimumWidth(paramValues[index].toInt());
        }

        index = paramNames.indexOf("height");
        if(index > -1)
        {
            widget->setMinimumHeight(paramValues[index].toInt());
        }

        if(classid == "QPushButton")
        {
            index = paramNames.indexOf("text");
            if(index > -1)
            {
                QPushButton *btn = static_cast<QPushButton*>(widget);
                btn->setText(paramValues[index]);

                connect(btn,SIGNAL(clicked()),this,SLOT(btnQtHello()));
            }
        }

        if(classid == "QRadioButton")
        {
            index = paramNames.indexOf("text");
            if(index > -1)
            {
                QRadioButton *rbtn = static_cast<QRadioButton*>(widget);
                rbtn->setText(paramValues[index]);

                connect(rbtn,SIGNAL(clicked()),qApp,SLOT(quit()));
            }
        }
    }

    return widget;
}
