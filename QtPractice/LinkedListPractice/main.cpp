#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
#define UNUSED(a) ((void)a)

template<typename T> class Node
{
public:
    Node(T data)
    {
        this->d = data;
        this->n = NULL;
    }

    Node<T> *next() {return n;}
    T data() { return d;}
    void link(Node<T> *node)
    {
        n = node;
    }

    operator T()
    {
        return d;
    }

    Node<T> &operator=(T data)
    {
        d = data;
        return *this;
    }

private:
    T d;
    Node<T> *n;

};

template<typename T> class LinkedList
{
public:
    LinkedList()
    {
        root = NULL;
    }

    void append(T data)
    {
        if(root == NULL)
        {
            root = new Node<T>(data);
        }
        else
        {
            Node<T> *tmp = new Node<T>(data);
            end()->link(tmp);
        }
    }

    void insertFirst(T data)
    {
        if(root == NULL)
        {
            root = new Node<T>(data);
        }
        else
        {
            Node<T> *tmp = new Node<T>(data);
            tmp->link(root);
            root = tmp;
        }
    }

    void insertAt(int index, T data)
    {
        if(index == 0)
        {
            insertFirst(data);
        }
        else if(index == count())
        {
            append(data);
        }
        else
        {
            Node<T> *tmp = new Node<T>(data);
            Node<T> *itr = getPosition(index);

            if(itr)
            {
                tmp->link(itr->next());
                itr->link(tmp);
            }
        }

    }

    void reverse()
    {
        Node<T> *itr = root;
        Node<T> *dest = NULL;

        while(itr != NULL)
        {
            root = root->next();
            itr->link(dest);
            dest = itr;
            itr = root;
        }
        root = dest;
    }

    int find(T me)
    {
        Node<T> *itr = root;
        int pos = -1;
        while(itr != NULL)
        {
            pos++;
            if(itr->data() == me)
            {
                break;
            }
            itr = itr->next();
        }

        return pos;
    }

    void swap(int pos1, int pos2)
    {
        Node<T> *itr1 = getPosition(pos1)->next();
        Node<T> *itr2 = getPosition(pos2)->next();

        T data = itr1->data();
        *itr1 = itr2->data();
        *itr2 = data;
    }

    bool sort(bool ascending = true)
    {
        if(count() > 0)
        {
            std::vector<T> array(count());
            extractData(array);

            if(ascending)
            {
                std::sort(array.begin(),array.end());
            }
            else
            {
                std::sort(array.begin(),array.end(),std::greater<T>());
            }

            insertData(array);
            return true;
        }
        else
        {
            return false;
        }
    }

    void display()
    {
        cout << "Data : ";
        Node<T> *itr = root;
        while(itr != NULL)
        {
            cout << itr->data() << "\t";
            itr = itr->next();
        }
        cout << "\n";
    }

    LinkedList<T> operator <<(T a)
    {
        append(a);
        return *this;
    }

    Node<T> & operator[](int index)
    {
        return *getPosition(index)->next();
    }


private:
    Node<T> * end()
    {
        if(root == NULL)
            return root;
        else
        {
            Node<T> *itr = root;
            while(itr->next() != NULL)
                itr = itr->next();
            return itr;
        }
    }

    int count()
    {
        Node<T> *itr = root;
        int count = 0;
        while(itr != NULL)
        {
            count++;
            itr = itr->next();
        }
        return count;
    }

    Node<T> *getPosition(int index)
    {
        Node<T> *itr = root;
        for(int i = 0; i < index - 1; i++)
            itr = itr->next();
        return itr;
    }

    void extractData(std::vector<T> &array)
    {
        Node<T> *itr = root;
        int index = 0;
        while(itr != NULL)
        {
            array[index] = itr->data();
            index++;
            itr = itr->next();
        }
    }

    void insertData(std::vector<T> &array)
    {
        Node<T> *itr = root;
        int index = 0;
        while(itr != NULL)
        {
            *itr = array[index];
            index++;
            itr = itr->next();
        }
    }


private:
    Node<T> *root;

};

int main()
{
    LinkedList<int> list;
    list << 1 << 2 << 3 << 4 << 5 << 6 << 7;

    list.insertFirst(0);

    list.insertAt(8,45);

    list[2] = 200;

    list.display();

    cout << "Element at index 2 : " << list[2] << endl;

    cout << "Found 200 @ " << list.find(200) << endl;

    list.swap(3,4);

    list.display();

    list.reverse();

    list.display();

    list.sort(false);

    list.display();

    LinkedList<char*> pList;

    pList << "ram" << "raj" << "vijay";

    pList.append("nag");

    pList.display();

    return 0;
}

