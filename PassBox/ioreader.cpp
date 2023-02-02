#include "ioreader.h"
#include "QDebug"

IOReader::IOReader(QObject *parent)
    : QObject{parent}
{

    timer = new QTimer(this);
    timer->setInterval(10);
    connect(timer, &QTimer::timeout , this,&IOReader::timerExec);

    setMode(door1LockNumber, 0);
    setMode(door1MagnetNumber,0);
    setMode(door1RelayNumber,1);

    setMode(door2LockNumber, 0);
    setMode(door2MagnetNumber,0);
    setMode(door2RelayNumber,1);

    setMode(door3LockNumber, 0);
    setMode(door3MagnetNumber,0);
    setMode(door3RelayNumber,1);

    setMode(dpsNumber, 0);
    setMode(uvNumber,1);

    m_door1State = 1;
    m_door2State = 1;
    m_door3State = 1;
    setdoor1State(0);
    setdoor2State(0);
    setdoor3State(0);
    digitalWrite(uvNumber ,0);

    timer->start();
}

void IOReader::timerExec()
{
    setDoor1Lock(digitalRead(door1LockNumber));
    setDoor1Manet(digitalRead(door1MagnetNumber));

    setDoor2Lock(digitalRead(door2LockNumber));
    setDoor2Manet(digitalRead(door2MagnetNumber));

    setDoor3Lock(digitalRead(door3LockNumber));
    setDoor3Manet(digitalRead(door3MagnetNumber));

    setDps(digitalRead(dpsNumber));
}

void IOReader::setMode(int pin, int mode)
{
    QString program = "gpio";
    QStringList arguments;
    arguments << "-g" << "mode" << QString::number( pin);


    if(mode == 1){
        arguments <<  "output" ;
    }
    else if(mode == 0){
        arguments <<  "input" ;
    }
    QProcess::execute(program, arguments);
}

void IOReader::digitalWrite(int pin, int value)
{
    QString program = "gpio";
    QStringList arguments;
    arguments << "-g" << "write" << QString::number( pin)<< QString::number( value);
    QProcess::execute(program, arguments);
}

int IOReader::digitalRead(int pin)
{

    QString program = "gpio";
    QStringList arguments;
    arguments << "-g" << "read" << QString::number( pin);
    QProcess myProcess ;
    myProcess.start(program, arguments);
    myProcess.waitForFinished(); // sets current thread to sleep and waits for pingProcess end
    QString output(myProcess.readAllStandardOutput());
    //qDebug() << output;
    return  output.toInt();
}



int IOReader::door1Lock() const
{
    return m_door1Lock;
}

void IOReader::setDoor1Lock(int newDoor1Lock)
{
    if (m_door1Lock == newDoor1Lock)
        return;
    m_door1Lock = newDoor1Lock;
    emit door1LockChanged();
}

int IOReader::door1Manet() const
{
    return m_door1Manet;
}

void IOReader::setDoor1Manet(int newDoor1Manet)
{
    if (m_door1Manet == newDoor1Manet)
        return;
    m_door1Manet = newDoor1Manet;
    emit door1ManetChanged();
}

int IOReader::door1State() const
{
    return m_door1State;
}

void IOReader::setdoor1State(int newDoor1State)
{
    if (m_door1State == newDoor1State)
        return;
    m_door1State = newDoor1State;
    emit door1StateChanged();
    qDebug() << "1 ################# " << newDoor1State;
    digitalWrite(door1RelayNumber , newDoor1State);
}

int IOReader::door2Lock() const
{
    return m_door2Lock;
}

void IOReader::setDoor2Lock(int newDoor2Lock)
{
    if (m_door2Lock == newDoor2Lock)
        return;
    m_door2Lock = newDoor2Lock;
    emit door2LockChanged();
}

int IOReader::door2Manet() const
{
    return m_door2Manet;
}

void IOReader::setDoor2Manet(int newDoor2Manet)
{
    if (m_door2Manet == newDoor2Manet)
        return;
    m_door2Manet = newDoor2Manet;
    emit door2ManetChanged();
}

void IOReader::setdoor2State(int newDoor2State)
{
    if (m_door2State == newDoor2State)
        return;
    m_door2State = newDoor2State;
    emit door2StateChanged();
    qDebug() << "2 ################# " << newDoor2State;
    digitalWrite(door2RelayNumber , newDoor2State);
}

int IOReader::door3Lock() const
{
    return m_door3Lock;
}

void IOReader::setDoor3Lock(int newDoor3Lock)
{
    if (m_door3Lock == newDoor3Lock)
        return;
    m_door3Lock = newDoor3Lock;
    emit door3LockChanged();
}

int IOReader::door3Manet() const
{
    return m_door3Manet;
}

void IOReader::setDoor3Manet(int newDoor3Manet)
{
    if (m_door3Manet == newDoor3Manet)
        return;
    m_door3Manet = newDoor3Manet;
    emit door3ManetChanged();
}

int IOReader::door3State() const
{
    return m_door3State;
}

void IOReader::setdoor3State(int newDoor3State)
{
    if (m_door3State == newDoor3State)
        return;
    m_door3State = newDoor3State;
    emit door3StateChanged();
    qDebug() << "3 ################# " << newDoor3State;
    digitalWrite(door3RelayNumber , newDoor3State);
}

int IOReader::dps() const
{
    return m_dps;
}

void IOReader::setDps(int newDps)
{
    if (m_dps == newDps)
        return;
    m_dps = newDps;
    emit dpsChanged();
}

int IOReader::light() const
{
    return m_light;
}

void IOReader::setlight(int newLight)
{
    if (m_light == newLight)
        return;
    digitalWrite(uvNumber , newLight);
    m_light = newLight;
    emit lightChanged();
}

int IOReader::door2State() const
{
    return m_door2State;
}
