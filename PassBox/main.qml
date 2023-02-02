import QtQuick 2.10
import QtQuick.Window 2.10
import QtGraphicalEffects 1.0
import App 1.0
import com.nourbakhsh.IOReader 1.0
import com.nourbakhsh.RNElapsedTimer 1.0
import Qt.labs.settings 1.0

Window {
    id: root
    property color background_color: Colors.background
    property color text_element_color: Colors.gradient_top_dark
    property color text_color: Colors.text_dark
    property bool isDark : true
    property int mState: 1

    width: 1024
    height: 600
    visible: true
    //visibility: "FullScreen"
    Component.onCompleted: {
        door1.mState = (reader.door1State == 1 && reader.door1Manet == 1 && reader.door1Lock == 0)?
                    "error" :
                    (reader.door1Manet == 1 ? "close" : "open");
        door2.mState = (reader.door2State == 1 && reader.door2Manet == 1 && reader.door2Lock == 0)?
                    "error" :
                    (reader.door2Manet == 1 ? "close" : "open");
        door3.mState = (reader.door3State == 1 && reader.door3Manet == 1 && reader.door3Lock == 0)?
                    "error" :
                    (reader.door3Manet == 1 ? "close" : "open");
    }

    RNElapsedTimer{
        id: door1Timer
    }
    RNElapsedTimer{
        id: door2Timer
    }
    RNElapsedTimer{
        id: door3Timer
    }
    RNElapsedTimer{
        id: countdownTimer
    }
    RNElapsedTimer{
        id: mainTimerTimer
    }

    Timer {
        id: timCountdown

        interval: 50; running: false; repeat: true
        onTriggered: {
            dimSlider.mHeader = "Waiting"
            dimSlider.isStarted = true;
            dimSlider.mTotalTime = settings.interlockTime;
            dimSlider.mCurrentTime =  settings.interlockTime - (countdownTimer.elapsed / 1000) + 1
            if((settings.interlockTime - (countdownTimer.elapsed / 1000)) < 0){
                timCountdown.stop();
                timMainTimer.start();
                timTimer.countdownStarted = false;
                reader.door1State = 1;
                reader.door2State = 1;
                reader.door3State = 1;
            }

//            // console.log("1   ====>State " + reader.door1State.toString());
//            // console.log("1   ====>Manet " + reader.door1Manet.toString());
//            // console.log("1   ====>Lock " + reader.door1Lock.toString());
//            // console.log("2   ======>State " + reader.door2State.toString());
//            // console.log("2   ======>Lock " + reader.door2Lock.toString());
//            // console.log("2   ======>Manet " + reader.door2Manet.toString());
//            // console.log("3   ========>State " + reader.door3State.toString());
//            // console.log("3   ========>Lock " + reader.door3Lock.toString());
//            // console.log("3   ========>Manet " + reader.door3Manet.toString());
        }
    }

    Timer {
        id: timMainTimer
        property int lockTries: 0;
        property bool isFirst: true;
        interval: 100; running: false; repeat: true
        onTriggered: {
            if(lockTries >=20){
                timMainTimer.stop();
                dimSlider.isStarted = false;
                mainTimerTimer.stop();
                dimSlider.mHeader = "READY";
                dimSlider.mTotalTime = 0;
                dimSlider.mCurrentTime = 0;
                timMainTimer.isFirst = true;
                reader.light = 0;
                reader.door1State = 0;
                reader.door2State = 0;
                reader.door3State = 0;
            }

            if((settings.doors ==  2 && (reader.door1Lock == 0 || reader.door2Lock == 0) ) ||
                    (settings.doors ==  3 && (reader.door1Lock == 0 || reader.door2Lock == 0 || reader.door3Lock == 0) ) )
            {
                mainTimerTimer.stop();
                lockTries++;
                return;
            }
            else if(timMainTimer.isFirst){
                mainTimerTimer.start();

                dimSlider.mHeader = "UV"
                reader.light = 1;
                timMainTimer.isFirst = false
                lockTries = 0;
            }
            dimSlider.isStarted = true;
            dimSlider.mTotalTime = settings.time;
            dimSlider.mCurrentTime =  settings.time - (mainTimerTimer.elapsed / 1000)
            if((settings.time - (mainTimerTimer.elapsed / 1000)) < 0){
                timMainTimer.stop();
                dimSlider.isStarted = false;
                mainTimerTimer.stop();
                dimSlider.mHeader = "READY";
                dimSlider.mTotalTime = 0;
                dimSlider.mCurrentTime = 0;
                reader.light = 0;
                timMainTimer.isFirst = true;
                reader.door1State = 0;
                reader.door2State = 0;
                reader.door3State = 0;
            }

//            // console.log("1   ====>State " + reader.door1State.toString());
//            // console.log("1   ====>Manet " + reader.door1Manet.toString());
//            // console.log("1   ====>Lock " + reader.door1Lock.toString());
//            // console.log("2   ======>State " + reader.door2State.toString());
//            // console.log("2   ======>Lock " + reader.door2Lock.toString());
//            // console.log("2   ======>Manet " + reader.door2Manet.toString());
//            // console.log("3   ========>State " + reader.door3State.toString());
//            // console.log("3   ========>Lock " + reader.door3Lock.toString());
//            // console.log("3   ========>Manet " + reader.door3Manet.toString());
        }
    }

    Settings {
        id: settings
        property string theme: "dark"
        property alias time: setting.setTime
        property alias interlockTime: setting.mInterLockTime
        property alias unlockTime: setting.mUlockTime
        property alias state: root.mState
        property alias doors: setting.doorsCount
    }

    IOReader{
        id: reader
        onDoor1ManetChanged: {
            door1.mState = (reader.door1State == 1 && reader.door1Manet == 1 && reader.door1Lock == 0)?
                        "error" :
                        (reader.door1Manet == 1 ? "close" : "open");
            if(reader.door1Manet == 0 && ((reader.door2Manet == 1 && settings.doors == 2) || (reader.door2Manet == 1 && reader.door3Manet == 1 && settings.doors == 3)))
            {
                reader.door2State = 1;
                if(settings.doors == 3)
                reader.door3State = 1;



            }
            if(reader.door1Manet == 0 && timTimer.countdownStarted){
                timTimer.countdownStarted = false;
                dimSlider.mHeader = "STOPED";
                dimSlider.mTotalTime = 0;
                dimSlider.mCurrentTime = 0;
                dimSlider.isStarted = fasle;
            }
//            // console.log("1   ====>State " + reader.door1State.toString());
//            // console.log("1   ====>Manet " + reader.door1Manet.toString());
//            // console.log("1   ====>Lock " + reader.door1Lock.toString());
//            // console.log("2   ======>State " + reader.door2State.toString());
//            // console.log("2   ======>Lock " + reader.door2Lock.toString());
//            // console.log("2   ======>Manet " + reader.door2Manet.toString());
//            // console.log("3   ========>State " + reader.door3State.toString());
//            // console.log("3   ========>Lock " + reader.door3Lock.toString());
//            // console.log("3   ========>Manet " + reader.door3Manet.toString());
        }

        onDoor2ManetChanged: {
            door2.mState = (reader.door2State == 1 && reader.door2Manet == 1 && reader.door2Lock == 0)?
                        "error" :
                        (reader.door2Manet == 1 ? "close" : "open");
            if(reader.door2Manet == 0 && ((reader.door1Manet == 1 && settings.doors == 2) || (reader.door1Manet == 1 && reader.door3Manet == 1 && settings.doors == 3)))
            {
                reader.door1State = 1;
                if(settings.doors == 3)
                reader.door3State = 1;


            }
            if(reader.door2Manet == 0 && timTimer.countdownStarted){
                timTimer.countdownStarted = false;
                dimSlider.mHeader = "STOPED";
                dimSlider.mTotalTime = 0;
                dimSlider.mCurrentTime = 0;
                dimSlider.isStarted = fasle;
            }
//            // console.log("1   ====>State " + reader.door1State.toString());
//            // console.log("1   ====>Manet " + reader.door1Manet.toString());
//            // console.log("1   ====>Lock " + reader.door1Lock.toString());
//            // console.log("2   ======>State " + reader.door2State.toString());
//            // console.log("2   ======>Lock " + reader.door2Lock.toString());
//            // console.log("2   ======>Manet " + reader.door2Manet.toString());
//            // console.log("3   ========>State " + reader.door3State.toString());
//            // console.log("3   ========>Lock " + reader.door3Lock.toString());
//            // console.log("3   ========>Manet " + reader.door3Manet.toString());
        }

        onDoor3ManetChanged: {
            door3.mState = (reader.door3State == 1 && reader.door3Manet == 1 && reader.door3Lock == 0)?
                        "error" :
                        (reader.door3Manet == 1 ? "close" : "open");
            if(reader.door3Manet == 0 && ((reader.door2Manet == 1 && reader.door1Manet == 1 && settings.doors == 3)))
            {
                reader.door2State = 1;
                reader.door1State = 1;
            }
            if(reader.door3Manet == 0 && timTimer.countdownStarted){
                timTimer.countdownStarted = false;
                dimSlider.mHeader = "STOPED";
                dimSlider.mTotalTime = 0;
                dimSlider.mCurrentTime = 0;
                dimSlider.isStarted = fasle;
            }

//            // console.log("1   ====>State " + reader.door1State.toString());
//            // console.log("1   ====>Manet " + reader.door1Manet.toString());
//            // console.log("1   ====>Lock " + reader.door1Lock.toString());
//            // console.log("2   ======>State " + reader.door2State.toString());
//            // console.log("2   ======>Lock " + reader.door2Lock.toString());
//            // console.log("2   ======>Manet " + reader.door2Manet.toString());
//            // console.log("3   ========>State " + reader.door3State.toString());
//            // console.log("3   ========>Lock " + reader.door3Lock.toString());
//            // console.log("3   ========>Manet " + reader.door3Manet.toString());
        }

        onDoor1LockChanged:  {
            door1.mState = (reader.door1State == 1 && reader.door1Manet == 1 && reader.door1Lock == 0)?
                        "error" :
                        (reader.door1Manet == 1 ? "close" : "open");
        }
        onDoor2LockChanged: {
            door2.mState = (reader.door2State == 1 && reader.door2Manet == 1 && reader.door2Lock == 0)?
                        "error" :
                        (reader.door2Manet == 1 ? "close" : "open");
        }
        onDoor3LockChanged: {
            door3.mState = (reader.door3State == 1 && reader.door3Manet == 1 && reader.door3Lock == 0)?
                        "error" :
                        (reader.door3Manet == 1 ? "close" : "open");
        }
        onDpsChanged: {
            if(reader.dps ==1)
                txtDPS.text =  "DIRTY"
            else
                txtDPS.text = "CLEAN"
        }
    }

    Rectangle{
        id: rectBackground
        anchors.fill: parent
        color: root.background_color
    }
    LinearGradient {
        anchors.fill: rectBackground
        start: Qt.point(0, rectBackground.height)
        end: Qt.point(rectBackground.width, 0 )
        gradient: Gradient {
            GradientStop { position: 0.4; color: "#151515" }
            GradientStop { position: 1.0; color: "#999999" }
        }
    }

//    Image {
//        id: imgPower
//        width: 80
//        height: 80
//        anchors.right: parent.right
//        anchors.rightMargin: 32
//        anchors.top: parent.top
//        anchors.topMargin: 32
//        fillMode: Image.PreserveAspectFit
//        source: "qrc:/images/power.svg"
//        sourceSize: Qt.size( 80, 80 )
//        Image {
//            id: imgPowerInner
//            source: parent.source
//            width: 0
//            height: 0
//        }
//        MouseArea
//        {
//            anchors.fill: parent
//            onClicked: {
//                if(root.mState == -1)
//                {
//                    root.mState = 1
//                    //wiringpi.setMode(18,1);
//                    //wiringpi.digitalWrite(18,1);
//                }
//                else
//                {
//                    root.mState = -1
//                    //wiringpi.setMode(18,1);
//                    //wiringpi.digitalWrite(18,0);
//                }
//                //                if(root.isDark)
//                //                {
//                //                    root.isDark = false;
//                //                    root.background_color = Colors.background_light;
//                //                    root.text_element_color= Colors.text_element_light;
//                //                    root.text_color= Colors.text_light;
//                //                }
//                //                else
//                //                {
//                //                    root.isDark = true;
//                //                    root.background_color = Colors.background_dark;
//                //                    root.text_element_color= Colors.text_element_dark;
//                //                    root.text_color= Colors.text_dark;
//                //                }
//            }

//        }
//    }
//    ColorOverlay{
//        anchors.fill: imgPower
//        source: imgPower
//        color: root.text_color
//    }

    Image {
        id: imgSetting
        width: 80
        height: 80
        visible: root.mState == 1
        anchors.right: parent.right
        anchors.rightMargin: 32
        anchors.top: parent.top
        anchors.topMargin: 32
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/setting.svg"
        sourceSize: Qt.size( 80, 80 )
        Image {
            id: imgSettingInner
            source: parent.source
            width: 0
            height: 0
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                root.mState = 2
            }

        }
    }
    ColorOverlay{
        anchors.fill: imgSetting
        source: imgSetting
        color: root.text_color
        visible: root.mState == 1
    }

    Image {
        id: imgHome
        width: 80
        height: 80
        visible: root.mState == 2
        anchors.right: parent.right
        anchors.rightMargin: 32
        anchors.top: parent.top
        anchors.topMargin: 32
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/home.svg"
        sourceSize: Qt.size( 80, 80 )
        Image {
            id: imgHomeInner
            source: parent.source
            width: 0
            height: 0
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                root.mState = 1
                setting.mState = "password"
                setting.pass = "";
            }

        }
    }
    ColorOverlay{
        anchors.fill: imgHome
        source: imgHome
        color: root.text_color
        visible: root.mState == 2
    }


    Image {
        id: imgTimer
        width: 80
        height: 80
        anchors.left: parent.left
        anchors.leftMargin: 32
        anchors.top: parent.top
        anchors.topMargin: 32
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/time.svg"
        sourceSize: Qt.size( 80, 80 )
        visible: root.mState == 1
        Image {
            id: imgTimerInner
            source: parent.source
            width: 0
            height: 0
        }
    }
    ColorOverlay{
        anchors.fill: imgTimer
        source: imgTimer
        color: "#737373"
        visible: root.mState == 1
    }

    Text{
        id: txtTime
        width: 200
        height: 80
        anchors.left: imgTimer.right
        anchors.leftMargin: 16
        anchors.top: parent.top
        anchors.topMargin: 32
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Light"
        font.weight: Font.Bold
        color: "#737373"
        verticalAlignment: Text.AlignVCenter
        text: settings.time + "(Sec)"
        visible: root.mState == 1
    }

    Image {
        id: imgDPS
        width: 80
        height: 80
        anchors.left: txtTime.right
        anchors.leftMargin: 32
        anchors.top: parent.top
        anchors.topMargin: 32
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/pressure.svg"
        sourceSize: Qt.size( 80, 80 )
        visible: root.mState == 1
        Image {
            id: imgDPSInner
            source: parent.source
            width: 0
            height: 0
        }
    }
    ColorOverlay{
        anchors.fill: imgDPS
        source: imgDPS
        color: (reader.dps == 1) ? "#f4527a" : "#52f4cc"
        visible: root.mState == 1
    }

    Text{
        id: txtDPS
        width: 200
        height: 80
        anchors.left: imgDPS.right
        anchors.leftMargin: 16
        anchors.top: parent.top
        anchors.topMargin: 32
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Light"
        font.weight: Font.Bold
        color: (reader.dps == 1) ? "#f4527a" : "#52f4cc"
        verticalAlignment: Text.AlignVCenter
        text: "CLEAN"
        visible: root.mState == 1
    }

    Image {
        id: imgAlarm
        width: 80
        height: 80
        anchors.left: txtDPS.right
        anchors.leftMargin: 32
        anchors.top: parent.top
        anchors.topMargin: 32
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/alarm.svg"
        sourceSize: Qt.size( 80, 80 )
        visible: root.mState == 1
        Image {
            id: imgAlarmInner
            source: parent.source
            width: 0
            height: 0
        }
    }
    ColorOverlay{
        anchors.fill: imgAlarm
        source: imgAlarm
        color: (door1.state == "error" || door2.state == "error" | door3.state == "error") ? "#f4527a" : "#737373"
        visible: root.mState == 1
    }

    Image {
        id: imgLamp
        width: 80
        height: 80
        anchors.left: imgAlarm.right
        anchors.leftMargin: 32
        anchors.top: parent.top
        anchors.topMargin: 32
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/lamp.svg"
        sourceSize: Qt.size( 80, 80 )
        visible: root.mState == 1
        Image {
            id: imgLampInner
            source: parent.source
            width: 0
            height: 0
        }
    }
    ColorOverlay{
        anchors.fill: imgLamp
        source: imgLamp
        color: (reader.light == 1) ? "#f47b52" : "#737373"
        visible: root.mState == 1
    }


    Timer{
        property bool isReady: false
        property bool countdownStarted: false
        property int lock1Try: 0;
        property int lock2Try: 0;
        property int lock3Try: 0;
        property int lock1TryClose: 0;
        property int lock2TryClose: 0;
        property int lock3TryClose: 0;
        id: timTimer
        interval: 50; running: true; repeat: true
        onTriggered: {
            if(timTimer.isReady &&
                    ((settings.doors == 2 && reader.door1Manet == 1 && reader.door2Manet == 1) ||
                     (settings.doors == 3 && reader.door1Manet == 1 && reader.door2Manet == 1 && reader.door3Manet == 1)))
                countdownStarted = true;
            var ready = ((((reader.door1Lock == 1 && reader.door2Lock == 0)  ||
                        (reader.door1Lock == 0 && reader.door2Lock == 1))
                       && settings.doors == 2) ||
                    ((((reader.door1Lock == 1 && reader.door2Lock == 1 && reader.door3Lock == 0)) ||
                      ((reader.door1Lock == 1 && reader.door2Lock == 0 && reader.door3Lock == 1)) ||
                      ((reader.door1Lock == 0 && reader.door2Lock == 1 && reader.door3Lock == 1)) )
                     && settings.doors == 3)) && !timTimer.countdownStarted && !timMainTimer.running;
            if(ready != timTimer.isReady)
                timTimer.isReady = ready;
            // console.log("IS Ready => " + timTimer.isReady);
//            if(lock1Try >=50){

//                timMainTimer.stop();
//                dimSlider.isStarted = false;
//                mainTimerTimer.stop();
//                dimSlider.mHeader = "READY";
//                dimSlider.mTotalTime = 0;
//                dimSlider.mCurrentTime = 0;
//                reader.light = 0;
//                reader.door1State = 0;
//                reader.door2State = 0;
//                reader.door3State = 0;
//                timTimer.countdownStarted = false;
//                // console.log("lock1Try")
//            }

//            if(reader.door1State == 1 && reader.door1Lock == 1 /*&& !timMainTimer.running*/ ){
//                timTimer.lock1Try ++;
//                timTimer.lock1TryClose = 0;
//            }
//            else{
//                timTimer.lock1TryClose ++;
//            }
//            if(timTimer.lock1TryClose > 20)
//            {
//                timTimer.lock1Try = 0;
//                timTimer.lock1TryClose = 0;
//            }

//            if(lock2Try >=50){

//                timMainTimer.stop();
//                dimSlider.isStarted = false;
//                mainTimerTimer.stop();
//                dimSlider.mHeader = "READY";
//                dimSlider.mTotalTime = 0;
//                dimSlider.mCurrentTime = 0;
//                reader.light = 0;
//                reader.door1State = 0;
//                reader.door2State = 0;
//                reader.door3State = 0;
//                timTimer.countdownStarted = false;
//                // console.log("lock2Try")
//            }

//            if(reader.door2State == 1 && reader.door2Lock == 1 /*&& !timMainTimer.running*/){
//                timTimer.lock2Try ++;
//                timTimer.lock2TryClose = 0;
//            }
//            else{
//                timTimer.lock2TryClose ++;
//            }
//            if(timTimer.lock2TryClose > 20)
//            {
//                timTimer.lock2Try = 0;
//                timTimer.lock2TryClose = 0;
//            }
//            if(lock3Try >=50){

//                timMainTimer.stop();
//                dimSlider.isStarted = false;
//                mainTimerTimer.stop();
//                dimSlider.mHeader = "READY";
//                dimSlider.mTotalTime = 0;
//                dimSlider.mCurrentTime = 0;
//                reader.light = 0;
//                reader.door1State = 0;
//                reader.door2State = 0;
//                reader.door3State = 0;
//                timTimer.countdownStarted = false;
//                // console.log("lock3Try")
//            }

//            if(reader.door3State == 1 && reader.door3Lock == 0 && settings.doors == 3 /*&& !timMainTimer.running*/){
//                timTimer.lock3Try ++;
//                timTimer.lock3TryClose = 0;
//            }
//            else{
//                timTimer.lock3TryClose ++;
//            }
//            if(timTimer.lock3TryClose > 20)
//            {
//                timTimer.lock3Try = 0;
//                timTimer.lock3TryClose = 0;
//            }
//            // console.log("reader.door1State " + reader.door1State);
//            // console.log("reader.door2State " + reader.door2State);
//            // console.log("reader.door3State " + reader.door3State);
//            // console.log("reader.door1Lock " + reader.door1Lock);
//            // console.log("reader.door2Lock " + reader.door2Lock);
//            // console.log("reader.door3Lock " + reader.door3Lock);
        }
        onCountdownStartedChanged: {
            if(timTimer.countdownStarted)
            {
                timTimer.isReady = false;
                countdownTimer.start();
                timCountdown.start();
            }
            else{
                countdownTimer.stop();
                timCountdown.stop();
                //dimSlider.mHeader = "READY";
            }
        }

        onIsReadyChanged: {
        }

    }


    Image {
        id: imgTemprature
        width: 80
        height: 80
        anchors.left: parent.left
        anchors.leftMargin: 32
        y : 175
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/temprature.svg"
        sourceSize: Qt.size( 80, 80 )
        visible: root.mState == 1
        Image {
            id: imgTempratureInner
            source: parent.source
            width: 0
            height: 0
        }
    }
    ColorOverlay{
        anchors.fill: imgTemprature
        source: imgTemprature
        color: "#737373"
        visible: root.mState == 1
    }

    Text{
        id: txtTemprature
        width: 200
        height: 80
        anchors.left: imgTemprature.right
        anchors.leftMargin: 16
        y : 175
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Light"
        font.weight: Font.Bold
        color: "#737373"
        verticalAlignment: Text.AlignVCenter
        text: "25" + "°"
        visible: root.mState == 1
    }

    Image {
        id: imgHumidity
        width: 80
        height: 80
        anchors.right: txtHumidity.left
        anchors.leftMargin: 16
        y : 175
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/humidity.svg"
        sourceSize: Qt.size( 80, 80 )
        visible: root.mState == 1
        Image {
            id: imgHumidityInner
            source: parent.source
            width: 0
            height: 0
        }
    }
    ColorOverlay{
        anchors.fill: imgHumidity
        source: imgHumidity
        color: root.text_color
        visible: root.mState == 1
    }

    Text{
        id: txtHumidity
        width: 150
        height: 80
        anchors.right : parent.right
        anchors.leftMargin: 32
        y : 175
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Light"
        font.weight: Font.Bold
        color: root.text_color
        verticalAlignment: Text.AlignVCenter
        text: "50" + "%"
        visible: root.mState == 1
    }


    CircleSlider{
        id:dimSlider
        y: 115
        x: (root.width - 200) / 2
        size: 200
        mHeader: "READY"
        mTime: dimSlider.mCurrentTime + "(Sec)"
        mTotalTime: 1000
        visible: root.mState == 1
    }


    Door2{
        id: door1
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        mWidth: settings.doors == 3 ? 340 : 512
        mHeight: 240
        mName: "Door 1"
        visible: root.mState == 1
    }

    Rectangle{
        id: rectLineDoor1
        anchors.left: door1.right
        anchors.top: door1.top
        anchors.bottom: door1.bottom
        width: 1
        color: "#737373"
        visible: root.mState == 1
    }

    Door2{
        id: door2
        anchors.left: rectLineDoor1.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        mWidth: settings.doors == 3 ? 340 : 512
        mHeight: 240
        mName: "Door 2"
        visible: root.mState == 1
    }

    Rectangle{
        id: rectLineDoor2
        anchors.left: door2.right
        anchors.top: door2.top
        anchors.bottom: door2.bottom
        width: 1
        color: "#737373"
        visible: root.mState == 1 && settings.doors == 3
    }

    Door2{
        id: door3
        anchors.left: rectLineDoor2.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        mWidth: 340
        mHeight: 240
        mName: "Door 3"
        visible: root.mState == 1 && settings.doors == 3
    }
    SettingPage{
        id: setting
        anchors.top: imgTimer.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        mState: "password"
        visible: root.mState == 2
        onOkClicked: {

            root.mState = 1
            setting.mState = "password"
            setting.pass = "";
        }
    }
}
