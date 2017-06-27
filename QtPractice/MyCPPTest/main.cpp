#include <iostream>

template<class T, T t = T()>
class A
{
private:
    template<bool b>
    class B
    {
    public:
        static const int m_n = b ? 1 : 0;
    };

public:
    static const int m_value = B<(t > T())>::m_n - B<(t < T())>::m_n;
};

int main()
{
    std::cout << A<int, -9>::m_value
              << A<bool, true>::m_value
              << A<char>::m_value << std::endl;

    return 0;
}
