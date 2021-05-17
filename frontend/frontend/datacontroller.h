#ifndef DATACONTROLLER_H
#define DATACONTROLLER_H

#include <QObject>

class DataController
{
private:
    QObject* root;
    QObject* right_up;
    QObject* right_dn;
    QObject* left;
public:
    DataController();
    DataController(QObject*);
};

#endif // DATACONTROLLER_H
