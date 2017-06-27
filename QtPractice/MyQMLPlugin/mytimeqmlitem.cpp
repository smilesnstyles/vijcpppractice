#include "mytimeqmlitem.h"
#include <QTime>
int MyTimeQmlItem::hour()
{
    return QTime::currentTime().hour();
}

int MyTimeQmlItem::min()
{
    return QTime::currentTime().minute();
}

MyTimeQmlItem::MyTimeQmlItem(QQuickItem *parent):
    QQuickItem(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
}

MyTimeQmlItem::~MyTimeQmlItem()
{
}

