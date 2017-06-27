#include "mylistmodal.h"

MyListModal::MyListModal(const QStringList &strings, QObject *parent ):
    QAbstractListModel(parent),
    stringList(strings)
{
    stringList << tr("raj1") << tr("raj2") ;
}

int MyListModal::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return stringList.count();
}

QVariant MyListModal::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (index.row() >= stringList.size())
        return QVariant();

    if (role == HeaderNameRole)
        return stringList[index.row()];
    else
        return QVariant();
}

QHash<int, QByteArray> MyListModal::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[HeaderNameRole] = "headerName";
    return roles;
}
