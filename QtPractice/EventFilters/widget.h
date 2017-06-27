#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>

namespace Ui {
class Widget;
}

struct MyStruct
{
    int eOne;
    char eTwo;
    int eThree;
};

class Widget : public QWidget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

protected:
    bool eventFilter(QObject *aObj, QEvent *aEvent);

signals:

    void mysignal(MyStruct);

public slots:
    void myclicked();
    void myenumslot(MyStruct);

private:
    Ui::Widget *ui;
};

Q_DECLARE_METATYPE(MyStruct)
#endif // WIDGET_H
