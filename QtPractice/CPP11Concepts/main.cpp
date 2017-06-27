#include <iostream>
#include <algorithm>
#include <thread>
#include <future>

using namespace std;

void myThread(std::future<int> &a)
{
    cout << "My Thread started \n";
    int x = a.get();
    cout << "Now i received my future - x : " << x << endl;
}

int main()
{
    // Lamda expression

    int a = 89;
    int b = 55;
    auto func = []()->bool{cout << "like a func ptr\n"; return true;};
    auto func1 = [a]()->bool{cout << "accessing a: " << a << endl; return true;};
    //auto func2 = [a]()->bool{cout << "pass by value modifying a: " << a << endl; a++; return true;}; // error

    auto func3 = [&a]()->bool{cout << "pass by reference modifying a: " << a << endl; a++; return true;}; // error

    auto func4 = [a,&b]()->int {cout << "a passby value and b passby reference \n"; int temp = b; b = a; return temp;};

    auto func5 = [=]() -> bool { cout << "all the defined values pass by value  a: " << a << " b: " << b << endl; return true;};

    func();
    func1();
    func3();
    cout << "Modified a " << a << endl;

    cout << "func4 returns : " << func4() << endl;
    cout << "Modified b : " << b << endl;
    func5(); // b' s old value came, it didnt take modification from prev function call of func4();

    auto func6 = [=]() -> bool { cout << "all the defined values pass by value  a: " << a << " b: " << b << endl; return true;};
    func6(); // it took all the recent changes of a & b. i.e by the time when you declare the lamda function the updated values
                //will be taken into the declaration.

    //auto func7 = [=]() -> bool { cout << "all the defined values pass by value  a: " << a++ << " b: " << b++ << endl; return true;}; // error


    auto func8 = [&a](int k)->bool {cout << "passed a by reference and assigned with given parameter k \n"; a = k; return true;};

    func8(100);
    cout << "new value of a after func8 : a = "<< a << endl;

    auto func9 = [&](int k)->bool {cout << "passed all declared values by reference and assigned with given parameter k \n"; a = k; b = k; return true;};

    func9(200);
    cout << "new value of a & b after func8 : a = "<< a << " b = " << b << endl;

    //auto func10 = []()->bool{cout << "can not access any out side variables \n" << a << endl; return false;}; // error


    int array[10] {1,2,3,4,5,6,7,8,9};

    int *index = std::find_if(array,array+10,[](const int k)->bool {cout << "K : " << k << endl; return k > 5;});

    cout << "value grether than 5 is :  " << *index << endl;

    int *index1 = std::find_if(array,array+10,[](const int k)->bool {cout << "K : " << k << endl; return k == 8;});

    cout << "value 8 exists :  :  " << *index1 << endl;

    std::promise<int> mypromise;
    std::future<int> fut = mypromise.get_future();

    std::thread t1(myThread,std::ref(fut));

    cout << "enter any value to promise : " ;
    int gh;

    cin >> gh;

    mypromise.set_value(gh);

    t1.detach();

    cout << "Waiting for thread to close\n";
    return 0;
}

