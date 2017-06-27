#include "MyController.h"
#include "MySingletonClass.h"

MyController::MyController(MySingletonClass *aMyStObj, QObject *parent) : QObject(parent)
{
    m_pMyStObj = aMyStObj;
    m_pTimer = new QTimer();
    m_iNameIndex = 0;
    m_lNameList << "Vijay" << "Raja" << "Rakesh" << "Sumanth" << "Kartheek" << "Kalpesh" << "Anupam";

    connect(m_pTimer,SIGNAL(timeout()),this,SLOT(setName()));
}

void MyController::startMyTimer()
{
    m_pTimer->start(2000);
}

void MyController::setName()
{
    if(m_iNameIndex < m_lNameList.size())
    {
        m_pMyStObj->setName(m_lNameList.at(m_iNameIndex));
        m_iNameIndex++;
    }
    else
    {
        m_iNameIndex = 0;
        m_pMyStObj->setName(m_lNameList.at(m_iNameIndex));
    }

}

