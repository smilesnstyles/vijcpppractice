#include "mapview.h"

MapView::MapView(QDeclarativeItem *parent ) : QDeclarativeItem(parent)
{
  gv = new QGraphicsView();
  proxy = new QGraphicsProxyWidget(this);
  QGraphicsScene *gs = new QGraphicsScene(0,0,360,300);

  QPixmap image1(QPixmap("C:/QtPractice/embedWidgte/map.JPG"));
  image1 = image1.scaledToHeight(700);
  image1 = image1.scaledToWidth(700);

  pixmap = new QGraphicsPixmapItem(image1);
  pixmap->setFlag(QGraphicsItem::ItemIsMovable);
  gs->addItem(pixmap);

  gv->setScene(gs);
  update();

  proxy->setWidget(gv);

  connect(proxy,SIGNAL(mapClicked()),qApp,SLOT(quit()));
  //QTimer::singleShot(1000,this,SLOT(startAnimation()));
}


void MapView::startAnimation()
{
    static int dx = -5;
    static int dy = -5;

    QTransform trans;
    trans.translate(dx, dy);

    pixmap->setTransform(trans);
    dx += -1;
    dy += -1;
    update();
    QTimer::singleShot(80,this,SLOT(startAnimation()));
    qDebug() << dx << dy;
}

