#ifndef MYLISTMODAL_H
#define MYLISTMODAL_H

#include <QAbstractListModel>
#include <QObject>
#include <QStringList>

class MyListModal : public QAbstractListModel
{
    Q_OBJECT

public:

    enum MyRoles {
            HeaderNameRole = Qt::UserRole + 1,
        };

    MyListModal(const QStringList &strings, QObject *parent = 0);

    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role) const;

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QStringList stringList;

};

#endif // MYLISTMODAL_H
