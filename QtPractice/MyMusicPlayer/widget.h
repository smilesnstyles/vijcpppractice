#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include<QFileSystemModel>
#include <ui_widget.h>
#include <QtMultimedia>
#include <QVideoWidget>

class Widget : public QWidget, public Ui::Widget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

private slots:
    void openFileDialog();
    void startMusic();
    void stopMusic();
    void adjustVolume(int);
    void adjustTrackTime(int aVal);
    void setTrackSliderValue(qint64);
    void playSelectedTrack(QModelIndex);
    void stateChanged(QMediaPlayer::State status);

signals:

    void playNow(int a = 90);

private:
    QMediaPlayer *m_pPlayer;
    QFileSystemModel *model;
    QVideoWidget *m_Video;

};

#endif // WIDGET_H
