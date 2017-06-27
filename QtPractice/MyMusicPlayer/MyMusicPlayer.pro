#-------------------------------------------------
#
# Project created by QtCreator 2014-12-01T12:04:17
#
#-------------------------------------------------

QT       += core gui multimedia

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets multimediawidgets

TARGET = MyMusicPlayer
TEMPLATE = app


SOURCES += main.cpp\
        widget.cpp

HEADERS  += widget.h

FORMS    += widget.ui

MOC_DIR=generated_files #Intermediate moc files directory
