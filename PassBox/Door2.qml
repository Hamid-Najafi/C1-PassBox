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
    property alias mName: txtName.text
    property alias mState: root.state
    width: 320
    height: 240
    state: "close"
    property int iconSize: 160

    Rectangle{
        id: rectIcon
        width: root.iconSize
        height: root.iconSize
        radius: root.iconSize / 2
        anchors.left: parent.left
        anchors.leftMargin: 16
        y: (root.height - root.iconSize) / 2
        color: "#01000000"
        border.width: 2
        border.color: root.state == "error" ? "#f4527a" : ( root.state == "close" ? "#737373" : "#ffffff")
        Image {
            id: imgIcon
            width: root.iconSize / 2
            height: root.iconSize / 2
            anchors.centerIn:  parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/door_closed.svg"
            sourceSize: Qt.size( root.iconSize / 2, root.iconSize / 2 )
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
            color: root.state == "error" ? "#f4527a" : ( root.state == "close" ? "#737373" : "#ffffff")
        }
    }

    Image {
        id: imgMagnet
        width: root.iconSize / 6
        height: root.iconSize / 6
        anchors.left: rectIcon.right
        anchors.leftMargin: 16
        anchors.top: txtState.bottom
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/magnet.svg"
        sourceSize: Qt.size( root.iconSize / 6, root.iconSize / 6 )
        Image {
            id: imgMagnetInner
            source: parent.source
            width: 0
            height: 0
        }

    }

    ColorOverlay{
        anchors.fill: imgMagnet
        source: imgMagnet
        color: root.state == "open" ? "#ffffff" :  "#737373"
    }

    Image {
        id: imglocker
        width: root.iconSize / 6
        height: root.iconSize / 6
        anchors.left: imgMagnet.right
        anchors.leftMargin: 32
        anchors.top: txtState.bottom
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/lock.svg"
        sourceSize: Qt.size( root.iconSize / 6, root.iconSize / 6 )
        Image {
            id: imglockerInner
            source: parent.source
            width: 0
            height: 0
        }

    }

    ColorOverlay{
        anchors.fill: imglocker
        source: imglocker
        color: root.state == "error" ? "#f4527a" : "#737373"
    }


    Text{
        id: txtName
        anchors.left: rectIcon.right
        anchors.leftMargin: 16
        anchors.top: rectIcon.top
        anchors.right: parent.right
        anchors.rightMargin: 32
        height: 60
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Light"
        font.weight: Font.Bold
        color: "#d9d9d9"
        verticalAlignment: Text.AlignVCenter
    }
    Text{
        id: txtState
        text:"CLOSE"
        anchors.left: rectIcon.right
        anchors.leftMargin: 16
        anchors.top: txtName.bottom
        anchors.right: parent.right
        anchors.rightMargin: 32
        x: (root.mWidth - root.iconSize) / 2
        width: root.mWidth -  (root.mWidth - root.iconSize) / 2
        height: 60
        font.family: "Cooper Hewitt"
        font.pixelSize: 28
        font.styleName: "Thin"
        font.weight: Font.Bold
        color: "#737373"
        verticalAlignment: Text.AlignVCenter
    }

    states: [
        State {
            name: "close"
            PropertyChanges {
                target: imgIcon
                source: "qrc:/images/door_closed.svg"
            }
            PropertyChanges {
                target: txtState
                text: "CLOSE"
            }
        },
        State {
            name: "open"
            PropertyChanges {
                target: imgIcon
                source: "qrc:/images/door_open.svg"
            }
            PropertyChanges {
                target: txtState
                text: "OPEN"
            }
        },
        State {
            name: "error"
            PropertyChanges {
                target: txtState
                text: "ERROR"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}
}
##^##*/
