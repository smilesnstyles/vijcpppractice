#ifndef MYIMAGEUPLOADERAPP_H
#define MYIMAGEUPLOADERAPP_H

#include <QWidget>
#include "MyTableView.h"
#include "ui_MyImageUploaderApp.h"
namespace Ui {
class Widget;
}

class Widget : public QWidget , public Ui::Widget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

public slots:
    void authenticate();
    void cancelAuthentication();

private:
    MyTableView *m_pMyTableView;


};

#endif // MYIMAGEUPLOADERAPP_H
