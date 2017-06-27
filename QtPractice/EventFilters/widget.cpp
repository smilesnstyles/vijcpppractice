#include "widget.h"
#include "ui_widget.h"
#include <qDebug>
#include <QMessageBox>

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    ui->setupUi(this);
    ui->pushButton->installEventFilter(this);
    qRegisterMetaType<MyStruct>();

    connect(ui->pushButton,SIGNAL(clicked()),this,SLOT(myclicked()));
    connect(this,SIGNAL(mysignal(MyStruct)),this,SLOT(myenumslot(MyStruct)),Qt::QueuedConnection);
}

Widget::~Widget()
{
    delete ui;
}

bool Widget::eventFilter(QObject *aObj, QEvent *aEvent)
{
    if((aObj == ui->pushButton) && (aEvent->type() == QEvent::MouseButtonPress))
    {
        ui->lineEdit->setText("Hi Vijay Event Filtered");
        //return true;
    }

    return QWidget::eventFilter(aObj,aEvent);
}

void Widget::myclicked()
{
    QMessageBox::information(this,"Hi","btn pressed","ok");
    MyStruct a;
    a.eOne = 9;
    a.eTwo = 'r';
    a.eThree = 67;
    emit mysignal(a);
}

void Widget::myenumslot(MyStruct a)
{
    qDebug() << "I Receieved MyEnum : " << a.eTwo;
}
