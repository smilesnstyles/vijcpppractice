#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>

enum MyEnums
{
    EMYONE,
    EMYTWO,
    EMYTHREE
};

class MyClass : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString mycolor READ getmycolor WRITE setmycolor NOTIFY mycolorChanged)
    Q_PROPERTY(int myage READ getmyage WRITE setmyage NOTIFY myageChanged)
    Q_PROPERTY(EAgeType agetype READ getagetype WRITE setagetype NOTIFY agetypeChanged)

    Q_ENUMS(EAgeType)
    Q_INVOKABLE void myhello();

    MyClass() {m_sMyColor = "grey"; m_iMyAge = 31; m_eAgeType = ETWO;}

    enum EAgeType {EONE, ETWO,ETHREE};

public slots:

    QString getmycolor();
    void setmycolor(QString aColor);

    int getmyage();
    void setmyage(int aAge);

    EAgeType getagetype();
    void setagetype(EAgeType aType);

    void helloage(int aAge);

signals:
    void mycolorChanged(QString &updatedColor);
    void myageChanged(int updatedAge);
    void agetypeChanged(EAgeType aType);
    void mysignal(MyEnums aEnum);

private:
    QString m_sMyColor;
    int m_iMyAge;
    EAgeType m_eAgeType;
};

#endif // MYCLASS_H
