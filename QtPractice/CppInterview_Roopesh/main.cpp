#include <iostream>

using namespace std;

class base
{
public:
    base(int a)
    {
        i = a;
    }

    int i;
};

class der : virtual public base
{
public:
    der(int a) : base (10)
    {
        i = a;
    }

    int i;
};


int main()
{
    der a(20);

    cout << a.i << endl;

    base *b = &a;

    cout << b->i << endl;

    return 0;
}

