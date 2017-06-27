#include <QApplication>
#include <QPushButton>
#include <QWidget>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
     QWidget window;
    QPushButton btn;

    btn.setParent(&window);
    window.show();
    return a.exec();
}
