#ifndef MYQMLPLUGIN_PLUGIN_H
#define MYQMLPLUGIN_PLUGIN_H

#include <QQmlExtensionPlugin>

class MyQMLPluginPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // MYQMLPLUGIN_PLUGIN_H

