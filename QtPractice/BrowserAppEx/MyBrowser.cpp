#include "MyBrowser.h"

MyBrowser::MyBrowser(QWidget *parent)
    : QWidget(parent)
{
    m_pMyView = new QWebView(this);
    m_pPage = new MyWebPage(QUrl(""));
    m_pMyView->setPage(m_pPage);
}

MyBrowser::~MyBrowser()
{

}
