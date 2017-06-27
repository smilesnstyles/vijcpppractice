#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QPropertyAnimation>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(ui->pushButton,SIGNAL(clicked(bool)),this,SLOT(startAnim()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::startAnim()
{
    QPropertyAnimation *anim = new QPropertyAnimation(ui->pushButton,"geometry");
    anim->setEndValue(QRect(600,ui->pushButton->y(),ui->pushButton->size().width(),ui->pushButton->size().height()));
    anim->setDuration(4000);
    anim->start();
}
