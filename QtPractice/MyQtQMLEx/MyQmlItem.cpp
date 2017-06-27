#include "MyQmlItem.h"
#include <QPen>
#include <QPainter>

MyQmlItem::MyQmlItem(QQuickPaintedItem *parent) :
    QQuickPaintedItem(parent)
{
    m_sColor = "red";
}

QString MyQmlItem::color() const
{
    return m_sColor;
}

void MyQmlItem::setcolor(QString aColor)
{
    m_sColor = aColor;
    update();
}

void MyQmlItem::paint(QPainter *painter)
{
    QRectF rect = boundingRect();
    QPen pen(QColor(m_sColor),3);
    painter->setPen(pen);
    painter->drawEllipse(rect);
}


