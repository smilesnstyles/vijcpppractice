#include "myitem.h"

MyItem::MyItem(QString aItemName)
{
    m_sItemName = aItemName;
}

QString MyItem::getItemName()
{
    return m_sItemName;
}

