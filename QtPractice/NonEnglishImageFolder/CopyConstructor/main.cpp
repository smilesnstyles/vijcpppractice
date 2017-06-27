#include <iostream>
#include<cstring>

using namespace std;

class base
{
public:
    base() { name = new char[10];}
    base(int a) { i = a;}
//    base(const base & b)
//    {
//        cout << "i am copy constructor" << "\n";
//        name = new char[10];
//        strcpy(name,b.name);
//    }

    void printNameAddress()
    {
        printf("Name address is %u",(unsigned int)&(this->name));
        i++;
    }

private:
    int i;
    char *name;
};

void myfun(base b)
{
    b.printNameAddress();

}

int main()
{
    base *b1 = new base;
    base *tmp = b1;

    tmp->printNameAddress();
    //delete tmp;

    b1->printNameAddress();

    myfun(*tmp);
    return 0;
}

