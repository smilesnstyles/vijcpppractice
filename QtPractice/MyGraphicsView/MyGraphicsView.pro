#-------------------------------------------------
#
# Project created by QtCreator 2014-12-04T14:00:21
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = MyGraphicsView
TEMPLATE = app


SOURCES += main.cpp\
        widget.cpp \
    myitem.cpp

HEADERS  += widget.h \
    myitem.h

FORMS    += widget.ui
