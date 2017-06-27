#ifndef MYLISTITEM_H
#define MYLISTITEM_H

#include <QQuickItem>
#include<QQuickPaintedItem>
#include <myitem.h>
#include <QQmlListProperty>

class MyListItem : public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<MyItem> myListItems READ getMyListItems NOTIFY myListItemsChanged)

public:
    MyListItem();

    QQmlListProperty<MyItem> getMyListItems();

    static int myListItemsCount(QQmlListProperty<MyItem> *property);
    static MyItem* getMyListItemAt(QQmlListProperty<MyItem> *property, int index);

    void paint(QPainter *painter);

signals:
    void myListItemsChanged();

private:
    QList<MyItem*> m_lItemsList;
};

#endif // MYLISTITEM_H
