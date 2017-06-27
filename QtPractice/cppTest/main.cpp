#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <string.h>
using namespace std;

class Person{
    public:
    Person() { memset(name,'\0',100);}
    virtual ~Person() {}

    virtual void getdata() = 0;

    virtual void putdata() = 0;
    protected:
    char name[100];
    int age;
};

class Professor : public Person {
    public :
    Professor() {cur_id++;}
    ~Professor() {}

    virtual void getdata() {

        scanf("%s %d %d",name,&age, &publications);
        if(age > 80)
            age = 80;
        if(publications > 1000)
            publications = 1000;
    }

    virtual void putdata() {
        cout << name << " " << age << " " << publications << endl;
    }

    private:
    int publications;
    static int cur_id;
};

int Professor::cur_id = 0;

class Student : public Person {
    public :
    Student() { cur_id++;}
    ~Student() {}

    virtual void getdata() {

        scanf("%s %d %d %d %d %d %d %d",name,&age, &marks[0], &marks[1], &marks[2], &marks[3], &marks[4], &marks[5]);
    }

    virtual void putdata() {
        cout << name << " " << age << " ";
        int total = 0;
        for(int i = 0; i < 6; i++){
            total += marks[i];
        }
        cout << total << endl;
    }

    private:
    int marks[6];
    static int cur_id;
};

int Student::cur_id = 0;

int main(){

    int n, val;
    cin >> n; //The number of objects that is going to be created.
    Person *per[n];

    for(int i = 0;i < n;i++){

        cin>>val;
        if(val == 1){
            // If val is 1 current object is of type Professor
            per[i] = new Professor;

        }
        else per[i] = new Student; // Else the current object is of type Student

        per[i]->getdata(); // Get the data from the user.

    }

    for(int i=0;i<n;i++)
        per[i]->putdata(); // Print the required output for each object.

    return 0;

}
