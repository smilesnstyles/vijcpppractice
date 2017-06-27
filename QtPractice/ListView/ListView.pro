TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

DEFINES ''= QMLJSDEBUGGER
DEFINES ''= QT_DECLARATIVE_DEBUG
CONFIG += qml_debug

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
