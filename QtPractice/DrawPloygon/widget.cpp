#include "widget.h"
#include "ui_widget.h"
#include<QPainter>
#include<QPen>
#include <QDebug>

Widget::Widget(QWidget *parent) :
    QWidget(parent)
{
    setupUi(this);
}

Widget::~Widget()
{

}

void Widget::paintEvent(QPaintEvent *)
{
    qDebug() << "Paint Event called" ;
    QPainter painter(this);

    QPolygon poly;

    poly << QPoint(10, 85) << QPoint(75, 75)
         << QPoint(100, 10) << QPoint(125, 75)
         << QPoint(200, 85) << QPoint(150, 125)
         << QPoint(160, 190) << QPoint(100, 150)
         << QPoint(40, 190) << QPoint(50, 125)\
         << QPoint(10, 85);

    QPen pen(Qt::blue,3,Qt::DotLine,Qt::RoundCap,Qt::RoundJoin);
    painter.setPen(pen);

    QBrush brush(Qt::red);

    QPainterPath path;
    path.addPolygon(poly);

    //painter.setBrush(brush);
    painter.drawPolygon(poly);
    painter.fillPath(path,brush);
    painter.drawText(40,95,QString("Hi Vijay"));
}
