#-------------------------------------------------
#
# Project created by QtCreator 2017-05-22T13:43:10
#
#-------------------------------------------------

QT       += core

QT       -= gui

TARGET = qmaketrails
CONFIG   += console thread
CONFIG += c++11
CONFIG   -= app_bundle

TEMPLATE = app
SOURCES+=main.cpp \
    MyThread.cpp

HEADERS += \
    MyThread.h
