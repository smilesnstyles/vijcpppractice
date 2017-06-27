#include "widget.h"
#include "ui_widget.h"
#include <QLineEdit>

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    ui->setupUi(this);

    m_pMyThread = new MyThread(false,this);

    connect(m_pMyThread,SIGNAL(valueChanged(int)),this,SLOT(onValueChanged(int)));
}

Widget::~Widget()
{
    delete ui;
}

void Widget::onValueChanged(int a)
{
    ui->m_pLineedit->setText(QString::number(a));
}

void Widget::on_m_pStartBtn_clicked()
{
    m_pMyThread->m_bStop = false;
    m_pMyThread->start();
}

void Widget::on_m_pStopBtn_clicked()
{
    m_pMyThread->m_bStop = true;
}


