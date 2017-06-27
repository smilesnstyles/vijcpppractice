#include<stdio.h>
#include <time.h>

int isLeapYear(int y1)
{
    if( (y1%100 == 0) && (y1 % 400 == 0))
    {
        return 0;
    }
    else if(y1 % 4 == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

int getCurrentYear()
{
    time_t rawtime;
    struct tm *info;
    time( &rawtime );
    info = localtime( &rawtime );

    return info->tm_year + 1900;
}

int getCurrentMonth()
{
    time_t rawtime;
    struct tm *info;
    time( &rawtime );
    info = localtime( &rawtime );

    return info->tm_mon;
}

int getCurrentDate()
{
    time_t rawtime;
    struct tm *info;
    time( &rawtime );
    info = localtime( &rawtime );

    return info->tm_mday;
}

int getToday()
{
    time_t rawtime;
    struct tm *info;
    time( &rawtime );
    info = localtime( &rawtime );

    return info->tm_wday;
}

int main()
{
    int y1,y2, m1,m2, d1,d2;
    int isLeapYear = 0;
    int i=0;
    int totalDays = 0;
    printf("Enter Date 1 : ");
    scanf("%d %d %d",&y1,&m1,&d1);
    printf("Enter Date 2 : ");
    scanf("%d %d %d",&y2,&m2,&d2);

    if(getCurrentYear() > y1)
    {
        int thisYear = getCurrentYear();
        for(i = 0; i < (thisYear - y1 - 1); i++)
        {
            if(isLeapYear(y1 + i + 1) == 1)
                totalDays += 366;
            else
                totalDays += 365;

        }



    }




    return 0;
}

