#ifndef MYBROWSER_H
#define MYBROWSER_H

#include <QtWidgets>
#include <mywebpage.h>
#include <QWebView>
#include <QtWebKit>

class MyBrowser : public QWidget
{
    Q_OBJECT

public:
    MyBrowser(QWidget *parent = 0);
    ~MyBrowser();

private:
    QWebView *m_pMyView;
    MyWebPage *m_pPage;

};

#endif // MYBROWSER_H
