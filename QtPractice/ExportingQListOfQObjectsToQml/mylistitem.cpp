#include "mylistitem.h"

MyListItem::MyListItem()
{
    MyItem *item1 = new MyItem("No. 1");
    MyItem *item2 = new MyItem("No. 2");
    MyItem *item3 = new MyItem("No. 3");
    MyItem *item4 = new MyItem("No. 4");

    m_lItemsList << item1 << item2 << item3 << item4;
}

QVariantList MyListItem::getMyListItems()
{
    QVariantList list;

    for(int i = 0; i < m_lItemsList.count();i++)
        list << QVariant::fromValue(m_lItemsList[i]);
    return list;
}

void MyListItem::paint(QPainter *painter)
{

}

