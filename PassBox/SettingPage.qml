import QtQuick 2.10
import QtQuick.Layouts 1.0
import App 1.0
import Qt.labs.settings 1.0

Item {
    id:root
    property color background_color: Colors.element_dark
    property color text_element_color: Colors.text_element_dark
    property color text_color: Colors.text_dark
    property color gradient_top_color: Colors.gradient_top
    property color gradient_bottom_color: Colors.gradient_bottom
    property color border_color: Colors.border_dark
    property alias mWidth: root.width
    property alias mHeight: root.height
    property alias mState: root.state
    property int setTime: 10
    property int setInterLockTime: 3
    property int mInterLockTime: 3
    property int setUlockTime: 3
    property int mUlockTime: 5
    property string pass: ""
    property int mTime: 30
    property int doorsCount: 3
    signal okClicked();
    property int mMode: 1


    state: "password"

    GridLayout{
        id: grdPassword
        rows: 5
        columns: 3
        anchors.centerIn: parent
        Rectangle{
            Layout.fillWidth : true
            Layout.columnSpan: 3
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 0
            radius: 2
            Rectangle{
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                height: 1
                color: Colors.text_dark
            }

            Text {
                id: txtPass
                text: {
                    var temp = "";
                    for(var i = 0;i<root.pass.length;i++)
                        temp = temp + "*";
                    return "Password : " + ( temp)}
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 1;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "1"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 1;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "2"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 2;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "3"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 3;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "4"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 4;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "5"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 5;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "6"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 6;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "7"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 7;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "8"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 8;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "9"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 9;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "←"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length > 0)
                        root.pass = root.pass.substring(0, root.pass.length -1);
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "0"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass.length < 5)
                        root.pass = root.pass + 0;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "OK"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.pass == "9998"){
                        root.state = "door"
                    }
                    if(root.pass == "1234"){
                        root.state = "time"
                    }
                }
            }
        }
    }

    GridLayout{
        id: grdDoors
        rows: 1
        columns: 2
        anchors.centerIn: parent
        visible: false
        Rectangle{
            width: 160
            height: 160
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                id: txtTwoDoor
                text: "2 Door"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 48
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    root.doorsCount = 2;
                    root.okClicked();
                }
            }
        }
        Rectangle{
            width: 160
            height: 160
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                id: txtThreeDoor
                text: "3 Door"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 48
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    root.doorsCount = 3;
                    root.okClicked();
                }
            }
        }
    }

    GridLayout{
        id: grdTime
        rows: 5
        columns: 7
        visible: false
        anchors.centerIn: parent
        Rectangle{
            Layout.fillWidth : true
            Layout.columnSpan: 3
            Layout.row: 0
            Layout.column: 0
            height: 80
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 0
            radius: 2
            Rectangle{
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                height: 1
                color: Colors.text_dark
            }

            Text {
                id: txtTime
                text: root.mTime.toString() + (root.mMode == 3 ?  " Minute(s)" : " Second(s)");
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 1
            Layout.column: 0
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "1"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 1;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 1
            Layout.column: 1
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "2"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 2;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 1
            Layout.column: 2
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "3"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 3;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 2
            Layout.column: 0
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "4"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 4;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 2
            Layout.column: 1
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "5"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 5;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 2
            Layout.column: 2
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "6"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 6;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 3
            Layout.column: 0
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "7"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 7;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 3
            Layout.column: 1
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "8"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 8;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 3
            Layout.column: 2
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "9"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 9;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 4
            Layout.column: 0
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "←"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length > 0)
                        root.mTime = root.mTime / 10;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 4
            Layout.column: 1
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "0"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if(root.mTime.toString().length < 5)
                        root.mTime = root.mTime * 10 + 0;
                }
            }
        }
        Rectangle{
            width: 80
            height: 80
            Layout.row: 4
            Layout.column: 2
            color: "#01000000"
            border.color: Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "OK"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    if( root.mMode == 1){
                        root.setTime = root.mTime;
                        if(root.setTime == 0)
                        {
                            root.setTime = 30
                        }
                        root.okClicked();
                    }
                    else if( root.mMode == 2){
                        root.mInterLockTime = root.mTime;
                        if(root.mInterLockTime == 0)
                        {
                            root.mInterLockTime = 3
                        }
                        root.okClicked();
                    }
                    else if( root.mMode == 3){
                        root.mUlockTime = root.mTime;
                        if(root.mUlockTime == 0)
                        {
                            root.mUlockTime = 30
                        }
                        root.okClicked();
                    }

                }
            }
        }

        Rectangle{
            width: 320
            height: 80
            Layout.row: 1
            Layout.column: 3
            Layout.columnSpan : 4
            color: "#01000000"
            border.color: root.mMode == 1 ? "#52cbf4" : Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "Ventilation Duration"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: root.mMode == 1 ? "#52cbf4" : Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    root.mMode = 1
                    root.mTime = root.setTime;
                }
            }
        }
        Rectangle{
            width: 320
            height: 80
            Layout.row: 2
            Layout.column: 3
            Layout.columnSpan: 4
            color: "#01000000"
            border.color: root.mMode == 2 ? "#52cbf4" : Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "Interlock Duration"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: root.mMode == 2 ? "#52cbf4" : Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    root.mMode = 2
                    root.mTime = root.mInterLockTime;
                }
            }
        }
        Rectangle{
            width: 320
            height: 80
            Layout.row: 3
            Layout.column: 3
            Layout.columnSpan: 4
            color: "#01000000"
            border.color: root.mMode == 3 ? "#52cbf4" : Colors.text_dark
            border.width: 1
            radius: 2
            Text {
                text: "Unlock Duration"
                anchors.centerIn: parent
                font.family: "Cooper Hewitt"
                font.pixelSize: 36
                font.styleName: "Thin"
                font.weight: Font.Bold
                color: root.mMode == 3 ? "#52cbf4" : Colors.text_dark
            }
            MouseArea{
                anchors.fill: parent
                onClicked : {
                    root.mMode = 3
                    root.mTime = root.mUlockTime;
                }
            }
        }
    }


    states: [
        State {
            name: "password"
            PropertyChanges {
                target: grdDoors
                visible: false
            }
            PropertyChanges {
                target: grdTime
                visible: false
            }
            PropertyChanges {
                target: grdPassword
                visible: true
            }
        },
        State {
            name: "door"
            PropertyChanges {
                target: grdDoors
                visible: true
            }
            PropertyChanges {
                target: grdTime
                visible: false
            }
            PropertyChanges {
                target: grdPassword
                visible: false
            }
        },
        State {
            name: "time"
            PropertyChanges {
                target: grdDoors
                visible: false
            }
            PropertyChanges {
                target: grdTime
                visible: true
            }
            PropertyChanges {
                target: grdPassword
                visible: false
            }
        }
    ]

}
