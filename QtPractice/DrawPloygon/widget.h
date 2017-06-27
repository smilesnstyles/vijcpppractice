#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include "ui_widget.h"

class Widget : public QWidget, public Ui::Widget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

private:

protected:
    void paintEvent(QPaintEvent *);



};

#endif // WIDGET_H
