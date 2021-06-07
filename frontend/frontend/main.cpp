#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include "datacontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlComponent component(&engine, QUrl::fromLocalFile("main.qml"));
    QObject *object = component.create();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    delete object;
    return app.exec();
}
