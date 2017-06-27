#ifndef MYTABLEVIEW_H
#define MYTABLEVIEW_H

#include <QTableView>
#include <QStandardItemModel>

class MyTableView : public QTableView
{
public:
    MyTableView(QWidget *parent = 0);

protected:
    virtual void dragEnterEvent(QDragEnterEvent *event);
    virtual void dragLeaveEvent(QDragLeaveEvent *event);
    virtual void dragMoveEvent(QDragMoveEvent *event);
    virtual void dropEvent(QDropEvent *event);

private :
    QStandardItemModel *m_mYModel;
    int m_iRowIndex;
};

#endif // MYTABLEVIEW_H
