#-------------------------------------------------
#
# Project created by QtCreator 2017-05-31T16:39:00
#
#-------------------------------------------------

QT       += core gui dbus

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = dbuspractice
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    test_interface.cpp

HEADERS  += mainwindow.h \
    test_interface.h

FORMS    += mainwindow.ui
