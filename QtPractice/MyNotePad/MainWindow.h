#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

public slots:

    void newFile();
    void openFile();
    void saveFile();
    void saveAsFile();
    void closeFile();
    void exitNotePad();

    void selectAll();
    void copy();
    void cut();
    void paste();

    void fontSizeChanged(QString aFontSize);
    void fontColorChanged(QString aFontColor);

    bool isFileModified();
    void setIsFileModified(bool aFileModified = true);
    void updateMenuItems();

signals:
    void isFileModifiedChanged(bool aFileModified);

private:
    Ui::MainWindow *ui;

    bool m_bIsFileModified;
    bool m_bIsTextSelected;
    bool m_bIsTextCopied;

};

#endif // MAINWINDOW_H
