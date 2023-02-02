#ifndef RNELAPSEDTIMER_H
#define RNELAPSEDTIMER_H

#include <QObject>
#include <QElapsedTimer>
#include <QDateTime>


class RNElapsedTimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int elapsed READ elapsed WRITE setElapsed NOTIFY elapsedChanged)
    Q_PROPERTY(bool running MEMBER m_running NOTIFY runningChanged)
private:
    QElapsedTimer m_timer;
    int m_elapsed;
    int m_start = 0;
    bool m_running;

public slots:
    void start() {
        this->m_elapsed = 0;
        this->m_running = true;
        this->m_timer.start();
        this->m_start = this->m_timer.elapsed();
        emit runningChanged();
    }

    void stop() {
        this->m_elapsed = this->m_timer.elapsed();
        this->m_running = false;
        this->m_start = this->m_timer.elapsed() - this->m_start;
        emit elapsedChanged();
        emit runningChanged();
    }
    int elapsed()  const {
        if(this->m_running)
            return m_timer.elapsed() - this->m_start;
        else
            return this->m_start;
    }

    void setElapsed(int newElapsed){}

signals:
    void runningChanged();
    void elapsedChanged();
};
#endif // RNELAPSEDTIMER_H
