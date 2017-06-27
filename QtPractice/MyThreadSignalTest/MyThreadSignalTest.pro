#-------------------------------------------------
#
# Project created by QtCreator 2015-11-17T14:08:53
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = MyThreadSignalTest
TEMPLATE = app


SOURCES += main.cpp\
        MyThreadSignalTest.cpp \
    MyThread1.cpp \
    MyThread2.cpp

HEADERS  += MyThreadSignalTest.h \
    MyThread1.h \
    MyThread2.h

FORMS    += MyThreadSignalTest.ui
