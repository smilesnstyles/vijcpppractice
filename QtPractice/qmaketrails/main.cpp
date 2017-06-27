#include <QCoreApplication>
#include <QDebug>
#include "MyThread.h"
#include <functional>
class base
{
public:
    base():i(90),j(89){}
    //virtual void hi() {}
    int i;
    char j;

};

class der : public base
{
public :
    der():i(91){}
    int i;
};

template<typename T, typename U> constexpr size_t offsetOf(U T::*member)
{
    return (char*)&((T*)nullptr->*member) - (char*)nullptr;
}

void stdfunction(int a)
{
    qDebug() << "Hello vijay you got the function man " << a;
}

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);
    MyThread t1;
    MyThread t2;

    t1.start();
    t2.start();

    der df;
    base *pb = &df;

    size_t offset = offsetOf(&der::j);
    qDebug() << "Hello Vijay " << *(int*)((char*)pb+offset) << endl;

    std::function<void(int)> func = stdfunction;
    func(10);
    return app.exec();
}
