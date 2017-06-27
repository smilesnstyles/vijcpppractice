#ifndef MYITEM_H
#define MYITEM_H

#include <QQuickItem>

class MyItem : public QQuickItem
{
    Q_OBJECT

    Q_PROPERTY(QString itemName READ getItemName NOTIFY itemNameChanged)
public:
    MyItem() {}
    MyItem(QString aItemName);

    QString getItemName();

signals:
    void itemNameChanged();

private:
    QString m_sItemName;
};

#endif // MYITEM_H
