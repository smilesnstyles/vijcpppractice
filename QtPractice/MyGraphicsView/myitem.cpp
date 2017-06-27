#include "myitem.h"
#include <QPainter>
#include <QDebug>
myitem::myitem(bool aType, QObject *parent)
{
    m_bType = aType;
    if(aType == false)
    {
        m_bPressed = false;
        setFlag(QGraphicsItem::ItemIsMovable);
    }
    else
    {
        angle = (qrand()%360);
        speed = 5;
        setRotation(angle);

        int startX = 0, startY = 0;

        if(qrand()%1)
        {
            startX = qrand() % 200;
            startY = qrand() % 200;
        }
        else
        {
            startX = qrand() % -100;
            startY = qrand() % -100;
        }

        setPos(mapToParent(startX,startY));
    }
}

QRectF myitem::boundingRect() const
{
    if(m_bType == false)
    {
        return QRectF(0,0,100,100);
    }
    else
    {
        return QRectF(0,0,20,20);
    }
}

void myitem::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    QRectF rect = boundingRect();

    if(m_bType == false)
    {
        if(m_bPressed)
        {
            QPen pen(Qt::red,3);
            painter->setPen(pen);
            painter->drawEllipse(rect);
        }
        else
        {
            QPen pen(Qt::blue,3);
            painter->setPen(pen);
            painter->drawRect(rect);
        }
    }
    else
    {
        if(scene()->collidingItems(this).isEmpty())
        {
            QPen pen(Qt::green,5);
            painter->setPen(pen);
        }
        else
        {
            QPen pen(Qt::red,5);
            painter->setPen(pen);

            doCollision();
        }
        painter->drawEllipse(rect);
    }
}

void myitem::mousePressEvent(QGraphicsSceneMouseEvent *event)
{
    if(!m_bType)
    {
        m_bPressed = true;
        update();
        QGraphicsItem::mousePressEvent(event);
    }
}

void myitem::mouseReleaseEvent(QGraphicsSceneMouseEvent *event)
{
    if(!m_bType)
    {
        m_bPressed = false;
        update();
        QGraphicsItem::mouseReleaseEvent(event);
    }
}

void myitem::advance(int phase)
{

    //qDebug() << "Advance called " ;
    if(!phase) return;
    QPointF loc = this->pos();

    setPos(mapToParent(0, -speed));
}

void myitem::doCollision()
{
    if(qrand() % 1)
    {
        setRotation(rotation() + (180 + (qrand() % 10)));
    }
    else
    {
        setRotation(rotation() + (180 + (qrand() % -10)));
    }

    QPointF newpoint = mapToParent(-(boundingRect().width()), -(boundingRect().width() + 2));

    if(!scene()->sceneRect().contains(newpoint))
    {
        newpoint = mapToParent(0,0);
    }
    else
    {
        setPos(newpoint);
    }
}
