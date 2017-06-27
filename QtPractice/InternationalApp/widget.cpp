#include "widget.h"
#include "ui_widget.h"

Widget::Widget(QWidget *parent) :
    QWidget(parent)
{
    setupUi(this);
}

Widget::~Widget()
{

}
