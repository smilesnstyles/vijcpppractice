#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>

namespace Ui {
class Widget;
}

class Widget : public QWidget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

protected:
    void mousePressEvent(QMouseEvent *event);

public slots:
    void pub_slot1();
    void pub_slot2(int b);

private slots:
    void pri_slot1();

signals:
    void mySignal1();
    void mysignal2(int a = 10);
private:
    Ui::Widget *ui;
};

#endif // WIDGET_H
