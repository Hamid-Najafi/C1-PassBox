#ifndef IOREADER_H
#define IOREADER_H

#include <QObject>
#include <QProcess>
#include <QTimer>

class IOReader : public QObject
{
    Q_OBJECT
public:
    explicit IOReader(QObject *parent = nullptr);
    Q_PROPERTY(int door1Lock READ door1Lock WRITE setDoor1Lock NOTIFY door1LockChanged)
    Q_PROPERTY(int door1Manet READ door1Manet WRITE setDoor1Manet NOTIFY door1ManetChanged)
    Q_PROPERTY(int door1State READ door1State WRITE setdoor1State NOTIFY door1StateChanged)

    Q_PROPERTY(int door2Lock READ door2Lock WRITE setDoor2Lock NOTIFY door2LockChanged)
    Q_PROPERTY(int door2Manet READ door2Manet WRITE setDoor2Manet NOTIFY door2ManetChanged)
    Q_PROPERTY(int door2State READ door2State WRITE setdoor2State NOTIFY door2StateChanged)

    Q_PROPERTY(int door3Lock READ door3Lock WRITE setDoor3Lock NOTIFY door3LockChanged)
    Q_PROPERTY(int door3Manet READ door3Manet WRITE setDoor3Manet NOTIFY door3ManetChanged)
    Q_PROPERTY(int door3State READ door3State WRITE setdoor3State NOTIFY door3StateChanged)

    Q_PROPERTY(int dps READ dps WRITE setDps NOTIFY dpsChanged)

    Q_PROPERTY(int light READ light WRITE setlight NOTIFY lightChanged)


    int door1Lock() const;
    void setDoor1Lock(int newDoor1Lock);

    int door1Manet() const;
    void setDoor1Manet(int newDoor1Manet);

    int door1State() const;
    void setdoor1State(int newDoor1State);

    int door2Lock() const;
    void setDoor2Lock(int newDoor2Lock);

    int door2Manet() const;
    void setDoor2Manet(int newDoor2Manet);

    void setdoor2State(int newDoor2State);

    int door3Lock() const;
    void setDoor3Lock(int newDoor3Lock);

    int door3Manet() const;
    void setDoor3Manet(int newDoor3Manet);

    int door3State() const;
    void setdoor3State(int newDoor3State);

    int dps() const;
    void setDps(int newDps);

    int light() const;
    void setlight(int newLight);

    int door2State() const;

signals:

    void door1LockChanged();

    void door1ManetChanged();

    void door1StateChanged();

    void door2LockChanged();

    void door2ManetChanged();

    void door2StateChanged();

    void door3LockChanged();

    void door3ManetChanged();

    void door3StateChanged();

    void dpsChanged();

    void lightChanged();

private:
    int m_door1Lock;
    int m_door1Manet;
    int m_door1State;
    int m_door2Lock;
    int m_door2Manet;
    int m_door2State;
    int m_door3Lock;
    int m_door3Manet;
    int m_door3State;
    int m_dps;
    void setMode(int pin, int mode);
    void digitalWrite(int pin, int value);
    int digitalRead (int pin) ;

    QTimer *timer;

    int door1LockNumber =  9;
    int door1MagnetNumber = 11;
    int door1RelayNumber = 7;

    int door2LockNumber =  22;
    int door2MagnetNumber = 10;
    int door2RelayNumber = 8;

    int door3LockNumber =  27;
    int door3MagnetNumber = 23;
    int door3RelayNumber = 25;

    int dpsNumber = 21;

    int uvNumber = 24;

    int m_light;

public slots:
    void timerExec();
};

#endif // IOREADER_H
