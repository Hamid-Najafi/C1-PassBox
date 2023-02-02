import QtQuick 2.10
import QtGraphicalEffects 1.0
import App 1.0

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
    property string mName: txtName.text
    property alias mState: root.state
    state: "close"
    property int iconSize: 150

    Rectangle{
        id: rectBackground
        anchors.fill: parent
        anchors.margins:  4
        color: root.gradient_bottom_color
        radius: 8
        gradient: Gradient {
               GradientStop { position: 0.0; color: root.gradient_top_color }
               GradientStop { position: 1.0; color: root.gradient_bottom_color }
           }
    }
        Rectangle{
            id: rectBorder
            anchors.fill: parent
            color: "#01000000"
            border.color: root.gradient_top_color
            border.width: 2
            radius: 8
        }
//    Rectangle{
//        id: rectBackground2
//        anchors.fill: parent
//        anchors.margins:  8
//        color: root.gradient_bottom_color
//        radius: 8
//        gradient: Gradient {
//               GradientStop { position: 0.0; color: root.gradient_bottom_color }
//               GradientStop { position: 1.0; color: root.gradient_top_color }
//           }
//    }

//    Image {
//        id: imgPicture
//        source: "qrc:/images/background.png"
//        anchors.fill: parent
//        layer.enabled:true
//        fillMode: Image.PreserveAspectFit
//        layer.effect: OpacityMask {
//            maskSource: Item {
//                width: imgPicture.width
//                height: imgPicture.height
//                Rectangle {
//                    anchors.centerIn: parent
//                    width: imgPicture.width
//                    height: imgPicture.height
//                    radius: 16
//                }
//            }
//        }
//    }
//    Rectangle{
//        id: rectBorder
//        anchors.fill: parent
//        color: "#01000000"
//        border.color: root.border_color
//        border.width: 4
//        radius: 8
//    }

//    Rectangle{
//        id: rectBullet1
//        anchors.left: parent.left
//        anchors.top: parent.top
//        anchors.margins: 16
//        width: 8
//        height: 8
//        color: root.background_color
//        border.color: root.border_color
//        border.width: 2
//        radius: 4
//        z: 1
//    }

//    Rectangle{
//        id: rectBullet2
//        anchors.right: parent.right
//        anchors.top: parent.top
//        anchors.margins: 16
//        width: 8
//        height: 8
//        color: root.background_color
//        border.color: root.border_color
//        border.width: 2
//        radius: 4
//        z: 1
//    }

//    Rectangle{
//        id: rectBullet3
//        anchors.left: parent.left
//        anchors.bottom: parent.bottom
//        anchors.margins: 16
//        width: 8
//        height: 8
//        color: root.background_color
//        border.color: root.border_color
//        border.width: 2
//        radius: 4
//        z: 1
//    }

//    Rectangle{
//        id: rectBullet4
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        anchors.margins: 16
//        width: 8
//        height: 8
//        color: root.background_color
//        border.color: root.border_color
//        border.width: 2
//        radius: 4
//        z: 1
//    }
    //    DropShadow{
    //        anchors.fill: rectBackground
    //        horizontalOffset: 0
    //        verticalOffset: 0
    //        radius: 8.0
    //        samples: 17
    //        color: root.background_color
    //        source: rectBackground
    //    }

    Text{
        id: txtName
        text: "Door"
        anchors.top: parent.top
        anchors.topMargin: 32
        x: (root.mWidth - root.iconSize) / 2
        width: root.mWidth -  (root.mWidth - root.iconSize) / 2
        height: 60
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Semibold"
        font.weight: Font.Bold
        color: root.text_element_color
        verticalAlignment: Text.AlignVCenter
    }
    Text{
        id: txtState
        text:"CLOSE"
        anchors.top: txtName.bottom
        anchors.topMargin: 8
        x: (root.mWidth - root.iconSize) / 2
        width: root.mWidth -  (root.mWidth - root.iconSize) / 2
        height: 50
        font.family: "Cooper Hewitt"
        font.pixelSize: 28
        font.styleName: "Light"
        font.weight: Font.Bold
        color: root.text_element_color
        verticalAlignment: Text.AlignVCenter
    }
    Image {
        id: imgIcon
        width: root.iconSize
        height: root.iconSize
        anchors.top: txtState.bottom
        anchors.topMargin: 8
        x: (parent.width - width) / 2
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/door_closed.svg"
        sourceSize: Qt.size( 128, 128 )
        Image {
            id: imgIconInner
            source: parent.source
            width: 0
            height: 0
        }

    }

    ColorOverlay{
        anchors.fill: imgIcon
        source: imgIcon
        color: root.text_color
    }
    MouseArea
    {
        anchors.fill: parent
        onClicked: {
            if(root.state == "close"){
                root.state = "open";
                txtState.text = "OPEN";
            }
            else{
                root.state = "close";
                txtState.text = "CLOSE";
            }
        }

    }


    states: [
        State {
            name: "close"
            PropertyChanges {
                target: imgIcon
                source: "qrc:/images/door_closed.svg"
            }
        },
        State {
            name: "open"
            PropertyChanges {
                target: imgIcon
                source: "qrc:/images/door_open.svg"
            }
        }
    ]
}
