#ifndef MYQMLITEM_H
#define MYQMLITEM_H

#include <QQuickPaintedItem>
#include <QPushButton>

class MyQmlItem : public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(QString color READ color WRITE setcolor)

public:
    explicit MyQmlItem(QQuickPaintedItem *parent = 0);

signals:

public slots:
    QString color() const;
    void setcolor(QString aColor);

protected:
    void paint(QPainter *painter);
private:
    QString m_sColor;
    QPushButton *m_pBtn;

};

#endif // MYQMLITEM_H
