#include "widget.h"
#include "ui_widget.h"

#include <QTimeLine>
#include <QGraphicsItemAnimation>
#include <QPropertyAnimation>
#include <QPushButton>
#include <QParallelAnimationGroup>
#include <QSequentialAnimationGroup>

#include <QGraphicsLinearLayout>
#include <QGraphicsWidget>
#include <QGraphicsProxyWidget>
#include <QGraphicsView>

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    ui->setupUi(this);

    m_pScene = new QGraphicsScene(this);

   // m_pRect = m_pScene->addRect(10,10,40,60,QPen(Qt::blue),QBrush(Qt::red));
    //m_pRect->setFlag(QGraphicsItem::ItemIsMovable);

    //m_pEllipse = m_pScene->addEllipse(10,100,40,60,QPen(Qt::blue),QBrush(Qt::green));
    //m_pEllipse->setFlag(QGraphicsItem::ItemIsMovable);

    //m_pText = m_pScene->addText(QString("Hello Vijay!"));
    //m_pText->setFlag(QGraphicsItem::ItemIsMovable);
    myitem *pMyItem = new myitem(false,this);
    m_pScene->addItem(pMyItem);
    ui->m_pGraphicsView->setScene(m_pScene);
    ui->m_pGraphicsView->setRenderHint(QPainter::Antialiasing);
    ui->m_pGraphicsView->setBackgroundBrush(QBrush(QColor("grey")));
    //ui->m_pGraphicsView->setForegroundBrush(QBrush(QColor("red")));


    m_pScene->setSceneRect(-200,-200,300,300);

    QLineF topLine(m_pScene->sceneRect().topLeft(),m_pScene->sceneRect().topRight());
    QLineF leftLine(m_pScene->sceneRect().topLeft(),m_pScene->sceneRect().bottomLeft());
    QLineF rightLine(m_pScene->sceneRect().topRight(),m_pScene->sceneRect().bottomRight());
    QLineF bottomLine(m_pScene->sceneRect().bottomLeft(),m_pScene->sceneRect().bottomRight());

    QPen mypen(Qt::red);

    m_pScene->addLine(topLine,mypen);
    m_pScene->addLine(rightLine,mypen);
    m_pScene->addLine(bottomLine,mypen);
    m_pScene->addLine(leftLine,mypen);

//    for(int i = 0; i < 20; i++)
//    {
//        myitem *item = new myitem(true,this);
//        m_pScene->addItem(item);
//    }

//    m_pTimer = new QTimer(this);
//    connect(m_pTimer, SIGNAL(timeout()),m_pScene,SLOT(advance()));

//    m_pTimer->start(100);

    QGraphicsItem *ball = new QGraphicsEllipseItem(-200,-200,20,20);
    (qgraphicsitem_cast<QGraphicsEllipseItem*>(ball))->setPen(QPen(QColor(Qt::red)));

    QTimeLine *pTimeLine = new QTimeLine(5000);
    pTimeLine->setFrameRange(0,100);

    QGraphicsItemAnimation *animation = new QGraphicsItemAnimation;
    animation->setItem(ball);
    animation->setTimeLine(pTimeLine);

    for(int i = 0; i < 200; i++)
    {
        animation->setPosAt(i/200.0,QPointF(i,0));
    }

    m_pScene->addItem(ball);

    pTimeLine->start();

    QPushButton *btn1 = new QPushButton("Hello");
    QPushButton *btn2 = new QPushButton("pollo");

    QPropertyAnimation *anim1 = new QPropertyAnimation(btn1,"pos");
    anim1->setDuration(3000);
    anim1->setStartValue(QPoint(-200,-200));
    anim1->setEndValue(QPoint(0,-200));

    QGraphicsLinearLayout *layout = new QGraphicsLinearLayout(Qt::Horizontal);

    QGraphicsProxyWidget *gbtn1  =  new QGraphicsProxyWidget;//= m_pScene->addWidget(btn1);
    gbtn1->setWidget(btn1);
    layout->addItem(gbtn1);

    QPropertyAnimation *anim2 = new QPropertyAnimation(btn2,"pos");
    anim2->setDuration(5000);
    anim2->setStartValue(QPoint(-200,-200));
    anim2->setEndValue(QPoint(0,-200));

    QGraphicsProxyWidget *gbtn2 = new QGraphicsProxyWidget; //= m_pScene->addWidget(btn2);
    gbtn2->setWidget(btn2);
    layout->addItem(gbtn2);

    QGraphicsWidget *wid = new QGraphicsWidget;
    wid->setLayout(layout);

    m_pScene->addItem(wid);

    QParallelAnimationGroup *group = new QParallelAnimationGroup;
    group->addAnimation(anim1);
    group->addAnimation(anim2);

    group->start();

}

Widget::~Widget()
{
    delete ui;
}
