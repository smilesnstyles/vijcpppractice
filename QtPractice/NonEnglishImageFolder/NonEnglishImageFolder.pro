TEMPLATE = app

QT += qml quick

SOURCES += main.cpp \
    MySingletonClass.cpp \
    MyController.cpp \
    mylistmodal.cpp

RESOURCES += qml.qrc

TRANSLATIONS = TranslationExample_en.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    MySingletonClass.h \
    MyController.h \
    mylistmodal.h
