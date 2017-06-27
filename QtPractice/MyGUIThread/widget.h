#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include "mythread.h"

namespace Ui {
class Widget;
}

class Widget : public QWidget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

    MyThread *m_pMyThread;

public slots:
    void onValueChanged(int);

private slots:
    void on_m_pStartBtn_clicked();
    void on_m_pStopBtn_clicked();

private:
    Ui::Widget *ui;
};

#endif // WIDGET_H
