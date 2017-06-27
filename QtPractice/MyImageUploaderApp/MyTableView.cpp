#include "MyTableView.h"
#include <QDebug>
#include <QtCore>
#include <QtGui>

MyTableView::MyTableView(QWidget *parent)
{
    setParent(parent);
    m_mYModel = new QStandardItemModel(12,3,this); //2 Rows and 3 Columns
    m_mYModel->setHorizontalHeaderItem(0, new QStandardItem(QString("File Path")));
    m_mYModel->setHorizontalHeaderItem(1, new QStandardItem(QString("Status")));
    m_mYModel->setHorizontalHeaderItem(2, new QStandardItem(QString("Remarks")));
    setModel(m_mYModel);
    setAcceptDrops(true);
    setDragDropMode(QAbstractItemView::DragDrop);
    setDragEnabled(true);
    m_iRowIndex = 0;

}

void MyTableView::dragEnterEvent(QDragEnterEvent *event)
{
    qDebug() << "Drag Enter" << endl;
    event->acceptProposedAction();
}

void MyTableView::dragLeaveEvent(QDragLeaveEvent *event)
{
    Q_UNUSED(event);
    qDebug() << "Drag Leave" << endl;
}

void MyTableView::dragMoveEvent(QDragMoveEvent *event)
{
    Q_UNUSED(event);
    qDebug() << "Drag Move" << endl;
}

void MyTableView::dropEvent(QDropEvent *event)
{
    qDebug() << "Drop Event" << endl;
    qDebug() << event->mimeData()->text() << endl;
    QStandardItem *firstRow = new QStandardItem(event->mimeData()->text());
    m_mYModel->setItem(m_iRowIndex,0,firstRow);
    firstRow = new QStandardItem("Uploading...");
    m_mYModel->setItem(m_iRowIndex,1,firstRow);

    m_iRowIndex++;
    event->acceptProposedAction();
}
