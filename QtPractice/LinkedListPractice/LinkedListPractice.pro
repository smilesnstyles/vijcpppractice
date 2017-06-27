TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp

QMAKE_CXXFLAGS += -Wno-write-strings

include(deployment.pri)
qtcAddDeployment()
