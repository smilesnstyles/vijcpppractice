#include <iostream>
#include <typeinfo>
using namespace std;

class Base
{
public:
    Base(): a(10),b(20),c(30),d(40) {}
    ~Base() {}

    virtual void hi() {
        cout << "Base::Hi\n";
    }

private:
    int a;
    int b;

protected:
    int c;
    int d;

    friend class MyFriend;
};

class MyFriend
{
public:
    MyFriend() {}
    ~MyFriend(){}

    void printPrivate(Base &b)
    {
        cout << "Private Data : a = " << b.a << " b = " << b.b << endl;
    }

    void printProtected(Base &b)
    {
        cout << "Private Data : c = " << b.c << " d = " << b.d << endl;
    }

};

class Der : public Base
{
public:

};

int main()
{
    Base b;
    MyFriend f;

    cout << "b object Type : " << typeid(b).name() << endl;
    cout << "f object Type : " << typeid(f).name() << endl;

    Base *p = new Der();

    cout << "p object Type : " << typeid(*p).name() << endl;

    Base *pb = dynamic_cast<Der*>(p);
    pb->hi();

    f.printPrivate(b);
    f.printProtected(b);
}



