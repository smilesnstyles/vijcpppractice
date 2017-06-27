#include "mylistitem.h"

MyListItem::MyListItem()
{
    MyItem *item1 = new MyItem("No. 1");
    MyItem *item2 = new MyItem("No. 2");
    MyItem *item3 = new MyItem("No. 3");
    MyItem *item4 = new MyItem("No. 4");

    m_lItemsList << item1 << item2 << item3 << item4;
}

QQmlListProperty<MyItem> MyListItem::getMyListItems()
{
    return QQmlListProperty<MyItem>(this,0,&myListItemsCount,&getMyListItemAt);
}

int MyListItem::myListItemsCount(QQmlListProperty<MyItem> *property)
{
    MyListItem *li = qobject_cast<MyListItem*>(property->object);
    if(li)
    {
        return li->m_lItemsList.count();
    }

    return 0;
}

MyItem *MyListItem::getMyListItemAt(QQmlListProperty<MyItem> *property, int index)
{
    MyListItem *li = qobject_cast<MyListItem*>(property->object);
    if(li)
    {
        return li->m_lItemsList.at(index);
    }

    return NULL;
}

void MyListItem::paint(QPainter *painter)
{

}

