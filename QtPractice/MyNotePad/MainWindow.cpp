#include "MainWindow.h"
#include "ui_MainWindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    m_bIsFileModified = false;
    m_bIsTextSelected = false;
    m_bIsTextCopied = false;

    ui->textEdit->setEnabled(false);
    ui->textEdit->setStyleSheet("background-color:grey");

    QStringList fontSizeList ;
    for(int i = 0; i < 10; i++)
    {
        fontSizeList << QString::number(i + 10);
    }

    QStringList fontColorList;

    fontColorList << "Red" << "Black" << "Blue" << "Greeen" << "Orange";

    ui->comboBoxFontColor->addItems(fontColorList);
    ui->comboBoxFontSize->addItems(fontSizeList);


    connect(ui->actionNew,SIGNAL(triggered(bool)),this,SLOT(newFile()));
    connect(ui->actionOpen,SIGNAL(triggered(bool)),this,SLOT(openFile()));
    connect(ui->actionSave,SIGNAL(triggered(bool)),this,SLOT(saveFile()));
    connect(ui->actionSave_As,SIGNAL(triggered(bool)),this,SLOT(saveAsFile()));
    connect(ui->actionClose,SIGNAL(triggered(bool)),this,SLOT(closeFile()));
    connect(ui->actionExit,SIGNAL(triggered(bool)),qApp,SLOT(quit()));

    connect(ui->actionSelect_All,SIGNAL(triggered(bool)),this,SLOT(selectAll()));
    connect(ui->actionCopy,SIGNAL(triggered(bool)),this,SLOT(copy()));
    connect(ui->actionCut,SIGNAL(triggered(bool)),this,SLOT(cut()));
    connect(ui->actionPaste,SIGNAL(triggered(bool)),this,SLOT(paste()));

    connect(ui->comboBoxFontSize,SIGNAL(currentIndexChanged(QString)),this,SLOT(fontSizeChanged(QString)));
    connect(ui->comboBoxFontColor,SIGNAL(currentIndexChanged(QString)),this,SLOT(fontColorChanged(QString)));

    connect(ui->textEdit,SIGNAL(textChanged()),this,SLOT(setIsFileModified()));
    connect(ui->textEdit,SIGNAL(textChanged()),this,SLOT(updateMenuItems()));


}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::newFile()
{
    ui->textEdit->setStyleSheet("background-color:white");
}

void MainWindow::openFile()
{

}

void MainWindow::saveFile()
{

}

void MainWindow::saveAsFile()
{

}

void MainWindow::closeFile()
{

}

void MainWindow::exitNotePad()
{

}

void MainWindow::selectAll()
{

}

void MainWindow::copy()
{

}

void MainWindow::cut()
{

}

void MainWindow::paste()
{

}

void MainWindow::fontSizeChanged(QString aFontSize)
{

}

void MainWindow::fontColorChanged(QString aFontColor)
{

}

bool MainWindow::isFileModified()
{
    return m_bIsFileModified;
}

void MainWindow::setIsFileModified(bool aFileModified)
{
    m_bIsFileModified = aFileModified;
}

void MainWindow::updateMenuItems()
{

}
