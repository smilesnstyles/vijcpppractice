#include "mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
}

MainWindow::~MainWindow()
{

}

int MainWindow::test(QString str)
{
    qDebug() << "You called test method in serive \n";
    if(str == QString("via ctor"))
    {
        return 101;
    }
    else if(str == QString("via setParent"))
    {
        return 102;
    }
    return 100;

}
