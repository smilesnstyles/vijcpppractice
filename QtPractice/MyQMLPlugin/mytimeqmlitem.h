#ifndef MYTIMEQMLITEM_H
#define MYTIMEQMLITEM_H

#include <QQuickItem>

class MyTimeQmlItem : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(MyTimeQmlItem)
public:

    Q_PROPERTY(int hour READ hour)
    Q_PROPERTY(int min READ min)

public slots:
    int hour();
    int min();

public:
    MyTimeQmlItem(QQuickItem *parent = 0);
    ~MyTimeQmlItem();

};

#endif // MYTIMEQMLITEM_H

