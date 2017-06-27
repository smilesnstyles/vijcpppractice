#include <iostream>

using namespace std;

void insertionSort(int *a, int size)
{
    int key = a[0];
    for(int i = 1; i < size; i++)
    {
        for(int j = i; j < size; j++)
        {   a[j-1] = a[j];
            if(key > a[j])
            {
                a[j] = key;
                key = a[j+1];
                break;
            }
        }

        for(int k = 0; k < size; k++)
            cout << a[k] <<"\t";
        cout << "\n";
    }
}

int main()
{
    int a[] = {8,4,5,3,2,6,7,2,6};
    insertionSort(a,9);

    cout << "Hello World!" << endl;
    return 0;
}

