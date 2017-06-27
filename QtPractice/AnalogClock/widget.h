#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include "ui_widget.h"

class Widget : public QWidget , public Ui::Widget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

protected:
    void paintEvent(QPaintEvent *);

private:
    QTimer *m_pTimer;
    int m_iPoint;
    int m_miPoint;

};

#endif // WIDGET_H
