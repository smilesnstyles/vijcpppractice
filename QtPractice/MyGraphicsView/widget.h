#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <QGraphicsScene>
#include <QGraphicsTextItem>
#include <QGraphicsEllipseItem>
#include <QGraphicsRectItem>
#include "myitem.h"
#include <QTimer>

namespace Ui {
class Widget;
}

class Widget : public QWidget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

private:
    Ui::Widget *ui;

    QGraphicsScene *m_pScene;
    QGraphicsEllipseItem *m_pEllipse;
    QGraphicsRectItem *m_pRect;
    QGraphicsTextItem *m_pText;
    myitem *m_pMyItem;
    QTimer *m_pTimer;

};

#endif // WIDGET_H
