#include "widget.h"
#include "ui_widget.h"
#include <QDebug>
#include <QMouseEvent>
Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    ui->setupUi(this);

    connect(ui->pushButton, SIGNAL(clicked(bool)),this,SLOT(pub_slot1()));
    connect(this,SIGNAL(mysignal2(int)),this,SLOT(pub_slot2(int)));
}

Widget::~Widget()
{
    delete ui;
}

void Widget::pub_slot1()
{
    qDebug() << "public slot called" << endl;
}

void Widget::pub_slot2(int b)
{
    qDebug() << "public slot called " << b << endl;
}


void Widget::pri_slot1()
{
    qDebug() << "private slot called" << endl;
}

void Widget::mousePressEvent(QMouseEvent *event)
{
    qDebug() << "Hello Boss";
    mysignal2();
    event->accept();
}
