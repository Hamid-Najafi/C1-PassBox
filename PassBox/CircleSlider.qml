import QtQuick 2.10
import QtQuick.Layouts 1.0
import QtQuick.Shapes 1.10  as Sh
import QtGraphicalEffects 1.0

Item{
    id: root
    property alias size: root.width
    property alias mHeader: txtHeader.text
    property alias mTime: txtPercent.text
    property double mTotalTime: 10
    property int mCurrentTime: 0
    property bool isStarted: false

    width: size
    height: size

    Sh.Shape {
        x: 0
        y: 0
        width: root.size
        height: root.size
        antialiasing: true
        layer.enabled: true
        layer.samples: 8

        Sh.ShapePath {
            property int startAngle: 230
            property int sweepAngle: -340
            id: baseShapePath
            fillColor: "#737373"
            strokeColor: "transparent"
            strokeWidth: 0
            capStyle: Sh.ShapePath.RoundCap
            startX: root.getBaseArcEndX(baseShapePath.startAngle,
                                        0,
                                        root.size / 2 - root.size / 16, // size minus strok
                                        root.size / 2)
            startY: root.getBaseArcEndY(baseShapePath.startAngle,
                                        0,
                                        root.size / 2 - root.size / 16,
                                        root.size / 2)
            PathArc{
                x:root.getBaseArcEndX(baseShapePath.startAngle,
                                      baseShapePath.sweepAngle,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(baseShapePath.startAngle,
                                      baseShapePath.sweepAngle,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                radiusX: root.size / 2 - root.size / 16
                radiusY: root.size / 2 - root.size / 16
                direction: PathArc.Counterclockwise
                useLargeArc: true
            }
            PathArc{
                x:root.getBaseArcEndX(baseShapePath.startAngle,
                                      baseShapePath.sweepAngle,
                                      root.size / 2, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(baseShapePath.startAngle,
                                      baseShapePath.sweepAngle,
                                      root.size / 2, // size minus strok
                                      root.size / 2)
                radiusX: root.size / 16 / 2
                radiusY: root.size / 16 / 2
                direction: PathArc.Clockwise
                useLargeArc: false
            }
            PathArc{
                x:root.getBaseArcEndX(baseShapePath.startAngle,
                                      0,
                                      root.size / 2 , // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(baseShapePath.startAngle,
                                      0,
                                      root.size / 2 , // size minus strok
                                      root.size / 2)
                radiusX: root.size / 2
                radiusY: root.size / 2
                direction: PathArc.Clockwise
                useLargeArc: true
            }
            PathArc{
                x:root.getBaseArcEndX(baseShapePath.startAngle,
                                      0,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(baseShapePath.startAngle,
                                      0,
                                      root.size / 2 - root.size / 16,
                                      root.size / 2)
                radiusX: root.size / 16 / 2
                radiusY: root.size / 16 / 2
                direction: PathArc.Clockwise
                useLargeArc: false
            }

        }

    }

    Sh.Shape {
        x: 0
        y: 0
        width: root.size
        height: root.size
        antialiasing: true
        layer.enabled: true
        layer.samples: 8

        Sh.ShapePath {
            property int startAngle: 230
            property int sweepAngle: (baseShapePath.sweepAngle * (root.mCurrentTime / root.mTotalTime)) / 100
            id: precentShape
            fillColor: "#ffffff"
            fillGradient:  Sh.ConicalGradient {
                id: grd
                angle: (360 - precentShape.startAngle) - ((360 + precentShape.sweepAngle) / 2)
                centerX: root.size / 2; centerY: root.size /2
                GradientStop {position: 0.0; color: root.isStarted ? "#f47b52" : "#52cbf4" }
                GradientStop { position: 1.0; color: root.isStarted ? "#f47b52" : "#52cbf4" }

            }
            strokeColor: "transparent"
            strokeWidth: 0
            capStyle: Sh.ShapePath.RoundCap
            startX: root.getBaseArcEndX(precentShape.startAngle,
                                        0,
                                        root.size / 2 - root.size / 16, // size minus strok
                                        root.size / 2)
            startY: root.getBaseArcEndY(precentShape.startAngle,
                                        0,
                                        root.size / 2 - root.size / 16,
                                        root.size / 2)
            PathArc{
                id: percentShapeArc1
                x:root.getBaseArcEndX(precentShape.startAngle,
                                      precentShape.sweepAngle,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(precentShape.startAngle,
                                      precentShape.sweepAngle,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                radiusX: root.size / 2 - root.size / 16
                radiusY: root.size / 2 - root.size / 16
                direction: PathArc.Counterclockwise
                useLargeArc: true
            }
            PathArc{
                x:root.getBaseArcEndX(precentShape.startAngle,
                                      precentShape.sweepAngle,
                                      root.size / 2, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(precentShape.startAngle,
                                      precentShape.sweepAngle,
                                      root.size / 2, // size minus strok
                                      root.size / 2)
                radiusX: root.size / 16 / 2
                radiusY: root.size / 16 / 2
                direction: PathArc.Clockwise
                useLargeArc: false
            }
            PathArc{
                id: percentShapeArc2
                x:root.getBaseArcEndX(precentShape.startAngle,
                                      0,
                                      root.size / 2 , // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(precentShape.startAngle,
                                      0,
                                      root.size / 2 , // size minus strok
                                      root.size / 2)
                radiusX: root.size / 2
                radiusY: root.size / 2
                direction: PathArc.Clockwise
                useLargeArc: true
            }
            PathArc{
                x:root.getBaseArcEndX(precentShape.startAngle,
                                      0,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(precentShape.startAngle,
                                      0,
                                      root.size / 2 - root.size / 16,
                                      root.size / 2)
                radiusX: root.size / 16 / 2
                radiusY: root.size / 16 / 2
                direction: PathArc.Clockwise
                useLargeArc: false
            }
        }



    }

    Timer{
        id: timTimer
        interval: 200; running: true; repeat: true
        onTriggered: {
            if(root.isStarted){
                txtHeader.color = "#f47b52";
                //txtHeader.text = "STARTED";
            }
            else{
                txtHeader.color = "#52cbf4";
                //txtHeader.text = "READY";
                precentShape.sweepAngle = baseShapePath.sweepAngle;
                percentShapeArc1.useLargeArc = true;
                percentShapeArc2.useLargeArc = true;
                return;
            }

            precentShape.sweepAngle = (baseShapePath.sweepAngle * (root.mCurrentTime / root.mTotalTime))
            if((precentShape.sweepAngle) > -180){
                percentShapeArc1.useLargeArc = false;
                percentShapeArc2.useLargeArc = false;
            }
            else {
                percentShapeArc1.useLargeArc = true;
                percentShapeArc2.useLargeArc = true;
            }

        }
    }


    Text {
        id: txtPercent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        y: root.size / 2
        height: root.size / 2
        color: "#d9d9d9"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.family: "Cooper Hewitt"
        font.pixelSize: 36
        font.styleName: "Thin"
        font.weight: Font.Bold
    }

    Text {
        id: txtHeader
        text: "DIM"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: root.size / 2
        color: "#52cbf4"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.family: "Cooper Hewitt"
        font.pixelSize: 36
        font.styleName: "Semibold"
        font.weight: Font.DemiBold
    }

    function getBaseArcEndX(startAngle, sweepAngle,radius ,center ){
        let angle =degrees_to_radians(   360 - startAngle - sweepAngle);
        let x = (center ) + (Math.cos(angle) * radius);// This is available in all editors.
        return x;
    }

    function getBaseArcEndY(startAngle, sweepAngle,radius ,center){
        let angle =degrees_to_radians(  360 - startAngle - sweepAngle);
        let y = (center ) - ( Math.sin(angle) * radius);
        return y;
    }

    function degrees_to_radians(degrees)
    {
        var pi = Math.PI;
        return degrees * (pi/180);
    }

    function radians_to_degrees(radians)
    {
        var pi = Math.PI;
        return (radians * 180) / pi;
    }

    function getPercent(){
        return Number.toString((precentArc.sweepAngle * 100 / baseArc.sweepAngle )) + "%"
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}
}
##^##*/
