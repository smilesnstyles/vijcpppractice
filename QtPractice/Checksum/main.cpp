#include <iostream>

using namespace std;

unsigned short int getIntLowerBits(unsigned char b)
{
    unsigned short int ret = (unsigned short int) b;
    return (unsigned short int) (ret & 0xFF);
}

unsigned short int getIntUpperBits(unsigned char b)
{
    unsigned short int ret = (unsigned short int) ((b << 8) & 0xFF00);
    return ret;
}

unsigned short int calculateChksum(unsigned char *buffer, int length)
{
    unsigned short int checksum = 0;

    int tempLen = length;
    if (length < 2)
        // something is horribly wrong
        return 0;

    if ((tempLen & 1) == 1)
        tempLen = tempLen - 1;

    for (int i = 0; i < tempLen; i += 2) {
        unsigned short int temp2 = getIntLowerBits(buffer[i]);
        unsigned short int temp1 = getIntUpperBits(buffer[i + 1]);

        unsigned short int temp = (unsigned short int) (temp1 | temp2);
        checksum += temp;
    }

    if ((length & 1) == 1) {
        unsigned short int temp = getIntLowerBits(buffer[length - 1]);
        checksum += temp;
    }
    checksum = (unsigned short int) (0x10000 - checksum);
    checksum = (unsigned short int) (checksum & 0xFFFF);
    return checksum;
}




int main()
{
    unsigned char data[] = {0xB6,0xB6,0x36,0x00,0x8F,0x02,0x01,0x00,0x00,0x00,
                                    0xEC,0x2C,0x02,0x00,0x00,0x00,0x06,0x53,0x75,0x62,
                                    0x61,0x72,0x75,0x03,0x43,0x61,0x72,0x00,0x00,0x04,
                                    0x47,0x65,0x6E,0x33,0x06,0x4D,0x59,0x32,0x30,0x31,
                                    0x37,0x06,0x30,0x30,0x30,0x30,0x30,0x30,0x88,0x13,
                                    0x03,0x01,0x00,0x00};

    unsigned short int checksum = calculateChksum(data,sizeof(data));

    std::cout << "Check sum is " << checksum << endl;
    return 0;
}

