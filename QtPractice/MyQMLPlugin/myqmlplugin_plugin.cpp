#include "myqmlplugin_plugin.h"
#include "mytimeqmlitem.h"

#include <qqml.h>

void MyQMLPluginPlugin::registerTypes(const char *uri)
{
    // @uri vijkia
    qmlRegisterType<MyTimeQmlItem>(uri, 1, 0, "MyTimeQmlItem");
}


