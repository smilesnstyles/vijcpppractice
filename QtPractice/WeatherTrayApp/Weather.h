#ifndef WEATHER_H
#define WEATHER_H

#include <QSystemTrayIcon>
#include <QtNetwork>
#include <QtXml>
#include<QActionGroup>
#include <QMenu>

class Weather : public QSystemTrayIcon
{
    Q_OBJECT

public:
    explicit Weather();
    ~Weather();

private slots:
    void requestXml();
    void readXml(QNetworkReply*);
    void createFile();
private:
    void populateToolTip(QDomDocument *doc);
    QString textForTag(const char* text, QDomDocument *doc);
    void createContextMenu();

private:
    QMenu menu;
    QNetworkAccessManager *m_pNetworkAccessManager;
    QNetworkReply *m_pReply;
    QFile m_File;
};

#endif // WEATHER_H
