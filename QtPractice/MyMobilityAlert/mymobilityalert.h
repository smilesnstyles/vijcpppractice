#ifndef MYMOBILITYALERT_H
#define MYMOBILITYALERT_H

#include <QSystemTrayIcon>
#include <QTimer>
#include <QIcon>

#include <QActionGroup>
#include<QMenu>
#include<QAction>

class MyMobiityAlert : public QSystemTrayIcon
{
    Q_OBJECT

public:
    MyMobiityAlert(QWidget *parent = 0);
    ~MyMobiityAlert();

private slots:
    void populateToolTip();

private:
    void createContextMenu();

private:
    QTimer *m_pTimer;
    QMenu menu;
};

#endif // MYMOBILITYALERT_H
