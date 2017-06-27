#ifndef MYLISTITEM_H
#define MYLISTITEM_H

#include <QQuickItem>
#include<QQuickPaintedItem>
#include <myitem.h>
#include <QQmlListProperty>

class MyListItem : public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(QVariantList myListItems READ getMyListItems NOTIFY myListItemsChanged)

public:
    MyListItem();

    QVariantList getMyListItems();

    void paint(QPainter *painter);

signals:
    void myListItemsChanged();

private:
    QList<MyItem*> m_lItemsList;
};

#endif // MYLISTITEM_H
