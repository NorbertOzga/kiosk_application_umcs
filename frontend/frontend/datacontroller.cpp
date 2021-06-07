#include "datacontroller.h"

#include <QObject>
#include <QDebug>

DataController::DataController()
{

}

DataController::DataController(QObject* obj)
{
    // Set root
    this->root = obj;
    if(this->root)
    {
        qDebug() << "OK";
    }
    else
    {
        qDebug() << "NOT OK";
    }
//    // Set left panel root
//    this->left = this->root->findChild<QObject*>("Left Panel");
//    qDebug() << this->left->objectName();
}
