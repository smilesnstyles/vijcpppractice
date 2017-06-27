#include "widget.h"
#include <QTimer>
#include <QPainter>

Widget::Widget(QWidget *parent) :
    QWidget(parent)
{
    setupUi(this);

    m_pTimer = new QTimer(this);

    m_pTimer->setInterval(1000);

    m_iPoint = 0;
    m_miPoint = 0;

    connect(m_pTimer,SIGNAL(timeout()),this,SLOT(update()));

    m_pTimer->start();
}

Widget::~Widget()
{

}

void Widget::paintEvent(QPaintEvent *)
{
    QPainter painter(this);
    painter.setRenderHint(QPainter::Antialiasing);
    painter.setPen(Qt::red);
    painter.drawEllipse(QRect(QPoint(0,0),QPoint(width(),height())));

    painter.translate(100,100);
    painter.rotate(m_miPoint);
    painter.drawLine(0,0,50,50);
    painter.rotate(m_iPoint);
    painter.drawLine(0,0,70,70);

//    QPolygon poly;

//    poly << QPoint(0,0) << QPoint(70,70);
//    QPainterPath path;
//    path.addPolygon(poly);
//    painter.drawPolygon(poly);
//    QBrush brush(Qt::blue);

//    painter.fillPath(path,brush);


    m_iPoint += 6;
    if(m_iPoint == 360)
    {
        m_miPoint += 6;
    }
}
