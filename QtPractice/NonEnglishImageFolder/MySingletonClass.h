#ifndef MYSINGLETONCLASS_H
#define MYSINGLETONCLASS_H

#include <QObject>

class MySingletonClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    explicit MySingletonClass(QObject *parent = 0);

    Q_INVOKABLE void setMyAge(int aAge);
    Q_INVOKABLE int getMyAge();

signals:
    void colorChanged();
    void nameChanged();
    void ageChanged();

public slots:
    QString color();
    void setColor(QString aColor);

    QString name();
    void setName(QString aName);

private:
    QString m_sColor;
    QString m_sName;
    int m_iMyAge;

};

#endif // MYSINGLETONCLASS_H
