#include "MyImageUploaderApp.h"
#include<QDebug>
#include <QMessageBox>


Widget::Widget(QWidget *parent) :
    QWidget(parent)
{
    setupUi(this);

    uploadWidget->setVisible(false);

    m_pMyTableView = new MyTableView();

    QHBoxLayout *hlay = new QHBoxLayout;
    hlay->addWidget(m_pMyTableView);

    widgetTableContainer->setLayout(hlay);

    connect(btnAuthOk,SIGNAL(clicked(bool)),this,SLOT(authenticate()));
    connect(btnAuthExit,SIGNAL(clicked(bool)),this,SLOT(cancelAuthentication()));
}

Widget::~Widget()
{

}

void Widget::authenticate()
{
    qDebug() << "Widget::authenticate <--" << endl;

    qDebug() << "User Name : " << leditUserName->text() << endl;
    qDebug() << "User Name : " << leditPassword->text() << endl;

    qDebug() << "Authentication Success " << endl;

    QMessageBox::information(this, "Authentication", "Authentication Success!");

    uploadWidget->setVisible(true);
    authFrame->setVisible(false);

    qDebug() << "Widget::authenticate -->" << endl;
}

void Widget::cancelAuthentication()
{
    qApp->quit();
}
