#ifndef MYWEBPAGE_H
#define MYWEBPAGE_H

#include <QWebPage>
#include <QWebFrame>

class MyWebPage : public QWebPage
{
    Q_OBJECT
public:
    explicit MyWebPage(QUrl aUrl);
public slots:
    void btnQtHello();
signals:
private:
    QObject* createPlugin(const QString &classid, const QUrl &url, const QStringList &paramNames, const QStringList &paramValues);

public slots:

};

#endif // MYWEBPAGE_H
