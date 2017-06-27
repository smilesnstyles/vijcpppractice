#include "Weather.h"

Weather::Weather()
    : QSystemTrayIcon(), m_File("myText2.mp3")
{
    setIcon(QIcon(":/images/Tulips.png"));

    if(m_File.open(QFile::ReadWrite | QFile::Append))
    {
        qDebug() << "File opened successfully";

    }
    else
    {
        qDebug() << "file open failed";
    }

    createContextMenu();

    m_pNetworkAccessManager = new QNetworkAccessManager(this);

    connect(m_pNetworkAccessManager,SIGNAL(finished(QNetworkReply*)),this,SLOT(readXml(QNetworkReply*)));

    QTimer::singleShot(0,this,SLOT(requestXml()));

}

Weather::~Weather()
{

}

void Weather::createContextMenu()
{
    QActionGroup *group = new QActionGroup(this);
    QAction *act1 = menu.addAction("Q&uit1");
    group->addAction(act1);
    act1->setCheckable(true);
    act1->setChecked(true);
    QAction *act2 = menu.addAction("Q&uit2");
    act2->setCheckable(true);
    group->addAction(act2);

    connect(group,SIGNAL(triggered(QAction*)),qApp,SLOT(quit()));

    menu.addAction(QIcon(":/images/Tulips.png"),"Q&uit",qApp,SLOT(quit()));
    setContextMenu(&menu);
}


void Weather::createFile()
{
    qDebug() << "Writing data" ;
    m_File.write(m_pReply->readAll());
}

void Weather::readXml(QNetworkReply *reply)
{
    qDebug() << "replay came " << reply->error();
    m_File.close();

    if(reply->error() == QNetworkReply::NoError)
    {

        QDomDocument document;

        if(document.setContent(reply))
        {
            populateToolTip(&document);
        }
        else
        {
            qDebug() << "Xml Error" ;
        }
    }
}

void Weather::populateToolTip(QDomDocument *doc)
{
    QString text = "<font color=darkblue>%1</font><br>";

    setToolTip(text);
}

QString Weather::textForTag(const char* text, QDomDocument *doc)
{
    QDomNodeList nodes = doc->elementsByTagName(text);
    if(!nodes.isEmpty())
    {
        QDomNode node = nodes.at(0);
        if(!node.isNull() && node.hasChildNodes())
        {
            return node.firstChild().nodeValue();
        }
    }

    return QString();
}

void Weather::requestXml()
{
    m_pReply = m_pNetworkAccessManager->get(QNetworkRequest(QUrl("http://n1.lisanym.com/telugu5/Oka%20Laila%20Kosam%20(2014)/04%20-%20Oka%20Laila%20Kosam.mp3")));
    //m_pNetworkAccessManager->get(QNetworkRequest(QUrl("http://w1.weather.gov/xml/current_obs/KAUS.xml")));

    connect(m_pReply,SIGNAL(readyRead()),this,SLOT(createFile()));

}
