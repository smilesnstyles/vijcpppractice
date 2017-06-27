#ifndef MYITEM_H
#define MYITEM_H

#include <QRectF>
#include <QGraphicsItem>
#include <QGraphicsScene>

class myitem : public QGraphicsItem
{

public:
    explicit myitem(bool type = false, QObject *parent = 0);

    QRectF boundingRect() const;

    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);

    bool m_bPressed;
    bool m_bType;

protected:
    void advance(int phase);
    void mousePressEvent(QGraphicsSceneMouseEvent *event);
    void mouseReleaseEvent(QGraphicsSceneMouseEvent *event);
private:
    qreal angle,speed;
    void doCollision();
signals:

public slots:

};

#endif // MYITEM_H
