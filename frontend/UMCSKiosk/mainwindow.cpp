#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    sendGETRequest(QString("http://0.0.0.0:5001/instagram_post/get_post"));
}


void MainWindow::sendGETRequest(QString url)
{
    QNetworkAccessManager *mgr = new QNetworkAccessManager(this);
    QNetworkRequest req;
    req.setUrl(QUrl(url));
    mgr->get(req);

    connect(mgr, &QNetworkAccessManager::finished, this, &MainWindow::parse_reply_from_server);
}

void MainWindow::parse_reply_from_server(QNetworkReply* reply)
{
    if (reply->error())
    {
        qDebug() << reply->errorString();
        return;
    }

    ui->label->setText(QString(reply->readAll()));
}

//void MainWindow::RequestFinished(QNetworkReply* reply)
//{
    
//}
