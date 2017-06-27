#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <QtDeclarative>
#include <QtGui>

class MapView : public QDeclarativeItem {
  Q_OBJECT
public:
  MapView(QDeclarativeItem *parent =0);

private:
  QGraphicsView *gv;
  QGraphicsProxyWidget *proxy;
  QGraphicsPixmapItem *pixmap;
public slots:
  void startAnimation();
signals:
  void mapClicked();
};

#endif // WIDGET_H
