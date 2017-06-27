#include "widget.h"
#include "ui_widget.h"
#include<QtWidgets>

Widget::Widget(QWidget *parent) :
    QWidget(parent)
{
    setupUi(this);

    m_pPlayer = new QMediaPlayer();
    m_pPlayer->setNotifyInterval(1000);
    m_Video = new QVideoWidget();
    m_pPlayer->setVideoOutput(m_Video);
    m_Video->resize(200, 300);
    m_Video->show();

    connect(m_pOpen,SIGNAL(clicked()),this,SLOT(openFileDialog()));
    connect(m_pPlay,SIGNAL(clicked()),this,SLOT(startMusic()));
    connect(m_pStop,SIGNAL(clicked()),this,SLOT(stopMusic()));
    connect(m_pStop,SIGNAL(clicked()),this,SIGNAL(playNow()));
    connect(m_pVolumeSlider,SIGNAL(valueChanged(int)),SLOT(adjustVolume(int)));
    //connect(m_pTrackTimeSlider,SIGNAL(valueChanged(int)),this,SLOT(adjustTrackTime(int)));
    connect(m_pPlayer,SIGNAL(positionChanged(qint64)),this,SLOT(setTrackSliderValue(qint64)));
    connect(m_pTreeWidget,SIGNAL(doubleClicked(QModelIndex)),this,SLOT(playSelectedTrack(QModelIndex)));
    connect(m_pPlayer,SIGNAL(volumeChanged(int)),m_pVolumeSlider,SLOT(setValue(int)));
    connect(m_pPlayer,SIGNAL(stateChanged(QMediaPlayer::State)),this,SLOT(stateChanged(QMediaPlayer::State)));

    connect(this,SIGNAL(playNow(int)),this,SLOT(adjustTrackTime(int)));

    m_pPlayer->setVolume(50);
}

Widget::~Widget()
{

}

void myConstValFun(const int &a)
{
    const_cast<int&>(a) = 90;
}

void Widget::openFileDialog()
{
    const int constInt = 9;
    printf("before cast and modify constInt %d \n",constInt);

    const_cast<int&>(constInt) = 89;
    printf("after cast and modify constInt = %d \n",constInt*2);

    myConstValFun(constInt);

    printf("aftre function call const value : %d \n",constInt);

    int &p = const_cast<int&>(constInt);

    p = 89;
    printf("after cast and modify using referece constInt = %d\n",constInt);

    QString path = QFileDialog::getExistingDirectory(this,
                                                     "Choose a Music Directory");
    qDebug() << "Path is : " << path;
    if(!path.isEmpty())
    {
        model = new QFileSystemModel(this);
        model->setRootPath(path);

        m_pTreeWidget->setModel(model);
        m_pTreeWidget->setRootIndex(model->index(path));
    }
}

void Widget::startMusic()
{
    if(m_pPlayer->state() == QMediaPlayer::PlayingState)
    {
        m_pPlayer->pause();
        m_pPlay->setText("Play");
    }
    else
    {
        if(!m_pPlayer->media().isNull())
        {
            m_pPlayer->play();
        }
        else
        {
            playSelectedTrack(m_pTreeWidget->currentIndex());
        }
        m_pPlay->setText("Pause");
    }
}

void Widget::stopMusic()
{
    m_pPlayer->stop();
}

void Widget::adjustVolume(int aVolume)
{
    m_pPlayer->setVolume(aVolume);
}

void Widget::adjustTrackTime(int aVal)
{
    qDebug() << "slider time: " << aVal;

}

void Widget::setTrackSliderValue(qint64 aCurrTime)
{
    qDebug() << aCurrTime;
    qint64 dura = m_pPlayer->duration();
    int step = (aCurrTime * 1000)/dura;
    m_pTrackTimeSlider->setValue(step);

    char buf[10] = {0};
    sprintf(buf,"%2lld:%2lld",aCurrTime/(1000*60),aCurrTime/(1000));

    m_pTrackCurrentTime->display(buf);
    m_pTrackCurrentTime->setPalette(Qt::red);
}

void Widget::playSelectedTrack(QModelIndex aIndex)
{
    qDebug() << aIndex.row() << aIndex.column();
    QString sourcePath = model->fileInfo(aIndex).absoluteFilePath();
    m_pPlayer->setMedia(QMediaContent(QUrl::fromLocalFile(sourcePath)));

    m_pPlayer->play();

}

void Widget::stateChanged(QMediaPlayer::State status)
{
    qDebug() << "State changed to : " << status;
    if(status == QMediaPlayer::StoppedState)
    {
        QModelIndex currIndex = m_pTreeWidget->currentIndex();
        qDebug() << currIndex.row() << currIndex.column();

        const QModelIndex index = m_pTreeWidget->indexBelow(m_pTreeWidget->currentIndex());
        if(index.isValid())
        {
            qDebug() << index.row() << index.column();
            playSelectedTrack(index);
        }
    }
}




