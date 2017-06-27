#include <QCoreApplication>

#include <QStringList>
#include <QVariant>
#include <QDebug>
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QStringList data = QString("hello/vijay/how/are/you").split(QChar('/'));
    QStringList data1 = QString("hi/durga/i/am/fine").split(QChar('/'));

    QVariantList hsData;

    QVariant data3(data);
    QVariant data4(data1);

    hsData.append(data3);
    hsData.append(data4);


    qDebug() << "Hello sir what is this" << endl;

    QStringList tmp = hsData[0].toStringList();

    for(int i = 0; i < tmp.count();i++)
    qDebug() << tmp[i] << "\t";
    qDebug() << endl;


    return a.exec();
}
