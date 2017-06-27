#include "mymobilityalert.h"
#include <QCoreApplication>

MyMobiityAlert::MyMobiityAlert(QWidget *parent)
    : QSystemTrayIcon()
{
    Q_UNUSED(parent);
    setIcon(QIcon(":/images/Tulips.png"));

    createContextMenu();

    m_pTimer = new QTimer(this);
    m_pTimer->setSingleShot(false);
    //m_pTimer->setInterval(900000);
    m_pTimer->setInterval(15000);

    connect(m_pTimer,SIGNAL(timeout()),this,SLOT(populateToolTip()));

    m_pTimer->start();
}

MyMobiityAlert::~MyMobiityAlert()
{

}

void MyMobiityAlert::populateToolTip()
{
    QString text = "Mr. Vijayakumar K ! Please Standup and Walk for a Minute. It is Very Important for Your Health Condition.";
    QString title = "Wakeup Alert!!!";
    showMessage(title,text,QSystemTrayIcon::Information,120000);
}

void MyMobiityAlert::createContextMenu()
{
    QActionGroup *group = new QActionGroup(this);
    QAction *act1 = menu.addAction("Q&uit1");
    group->addAction(act1);
    act1->setCheckable(true);
    act1->setChecked(true);

    connect(group,SIGNAL(triggered(QAction*)),qApp,SLOT(quit()));

    setContextMenu(&menu);
}
