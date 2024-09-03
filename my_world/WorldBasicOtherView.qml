import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

ColumnLayout{

    RowLayout{
        id:progressBarLay
        height: 100
        Item{
            width: 40
        }

        Rectangle {
            height: parent.height
            width: 150
            color: "#00000000"
            Text{
                anchors.centerIn: parent
                text: "ProgressBar"
                font{
                    family: window.mFONT_FAMILY
                    pointSize: 18
                }
                color: "white"
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle{
            height: parent.height
            width: 480
            color: "#00000000"

            //自定义进度条1
            Rectangle{
                id:progresstype1
                width: 300
                height: 3
                radius: 3
                color: "#555555"
                anchors{
                    left: parent.left
                    leftMargin: 60
                    top: parent.top
                    topMargin: 30
                }
                Rectangle{
                    height: parent.height
                    radius: parent.radius
                    color: "white"
                    width: parent.pos
                    PropertyAnimation on width{
                        from:0
                        to:300
                        duration: 3000
                        loops: Animation.Infinite
                    }
                }
            }

            //自定义进度条2
            Rectangle{
                id:progresstype2
                property int pos:0
                width: 300
                height: 3
                radius: 3
                color: "#555555"
                clip: true
                anchors{
                    left: parent.left
                    leftMargin: 60
                    top: progresstype1.bottom
                    topMargin: 30
                }
                Rectangle{
                    height: parent.height
                    radius: parent.radius
                    color: "white"
                    width: 40
                    PropertyAnimation on x{
                        from:-40
                        to:300
                        duration: 2000
                        loops: Animation.Infinite
                        easing.type: Easing.OutQuad
                    }
                }
                Rectangle{
                    id:pro2
                    height: parent.height
                    radius: parent.radius
                    color: "white"
                    width: 40
                    x:-40
                    SequentialAnimation{
                        running: true
                        PauseAnimation{
                            duration: 1000
                        }
                        PropertyAnimation{
                            target: pro2
                            property: "x"
                            from:-40
                            to:300
                            duration: 2000
                            loops: Animation.Infinite
                            easing.type: Easing.OutQuad
                        }
                    }


                }
            }


        }

    }
    Shape{
        anchors.fill: parent
        ShapePath{
            strokeWidth: 0
            strokeColor: "#888888"
            strokeStyle: ShapePath.SolidLine
            startX: 40
            startY: progressBarLay.y +progressBarLay.height+20
            PathLine{
                x:40
                y:progressBarLay.y +progressBarLay.height+20
            }
            PathLine{
                x:parent.width-40
                y:progressBarLay.y +progressBarLay.height+20
            }
        }
    }
    Item{
        height: 20
    }

    RowLayout{
        id:busyIndicatorLay
        height: 100
        Item{
            width: 40
        }

        Rectangle {
            height: parent.height
            width: 150
            color: "#00000000"
            Text{
                anchors.centerIn: parent
                text: "BusyIndicator"
                font{
                    family: window.mFONT_FAMILY
                    pointSize: 18
                }
                color: "white"
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle{
            height: parent.height
            width: 480
            color: "#00000000"

            //自定义busyIndicator1,颜色1
            BusyIndicator {
                id: busyIndicatortype1color1
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.verticalCenter: parent.verticalCenter
                implicitWidth: 72
                implicitHeight: 72
                running: true

                contentItem: Item {
                    Rectangle {
                        id: busyIndicatorrect1
                        width: parent.width
                        height: parent.height
                        color: Qt.rgba(0, 0, 0, 0)
                        radius: width / 2
                        border.width: width / 6
                        visible: false
                    }

                    ConicalGradient {
                        width: busyIndicatorrect1.width
                        height: busyIndicatorrect1.height
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#888888"
                            }
                            GradientStop {
                                position: 1.0
                                color: "#444444"
                            }
                        }
                        source: busyIndicatorrect1

                        Rectangle {
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: busyIndicatorrect1.border.width
                            height: width
                            radius: width / 2
                            color: "#444444"
                        }

                        RotationAnimation on rotation {
                            from: 0
                            to: 360
                            duration: 1000
                            loops: Animation.Infinite
                        }
                    }
                }
            }
            //自定义busyIndicator1,颜色2
            BusyIndicator {
                id: busyIndicatortype1color2
                anchors.left: busyIndicatortype1color1.right
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                implicitWidth: 72
                implicitHeight: 72
                running: true

                contentItem: Item {
                    Rectangle {
                        id: busyIndicatorrect2
                        width: parent.width
                        height: parent.height
                        color: Qt.rgba(0, 0, 0, 0)
                        radius: width / 2
                        border.width: width / 6
                        visible: false
                    }

                    ConicalGradient {
                        width: busyIndicatorrect2.width
                        height: busyIndicatorrect2.height
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#503388ee"
                            }
                            GradientStop {
                                position: 1.0
                                color: "#2299ff"
                            }
                        }
                        source: busyIndicatorrect2

                        Rectangle {
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: busyIndicatorrect2.border.width
                            height: width
                            radius: width / 2
                            color: "#2299ff"
                        }

                        RotationAnimation on rotation {
                            from: 0
                            to: 360
                            duration: 1000
                            loops: Animation.Infinite
                        }
                    }
                }
            }

            //自定义busyIndicator2,颜色1
            Rectangle{
                id:busyIndicatortype2color1
                width: 100
                height: 100
                anchors.left: busyIndicatortype1color2.right
                anchors.leftMargin: 40
                anchors.verticalCenter: parent.verticalCenter
                color: "#00ff0000"
                SequentialAnimation{
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation{
                        target: progressshapePath
                        property: "t"
                        from: 0
                        to: 0.75
                        duration: 600
                    }
                    NumberAnimation{
                        target: progressshapePath
                        property: "t"
                        from: 0.75
                        to: 1
                        duration: 600
                    }
                }
                SequentialAnimation{
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation{
                        target: progressshapePath
                        property: "s"
                        from: 0
                        to: 0.25
                        duration: 600
                    }
                    NumberAnimation{
                        target: progressshapePath
                        property: "s"
                        from: 0.25
                        to: 1
                        duration: 600
                    }
                }

                Shape{
                    anchors.fill: parent
                    antialiasing: true
                    ShapePath{
                        id:progressshapePath
                        property real t:0
                        property real s:0

                        strokeColor: "#a055ff55"
                        strokeWidth: 6
                        strokeStyle: ShapePath.SolidLine
                        fillColor: "#00000000"
                        startX: 50 - 25*Math.sin(progressshapePath.s*2*Math.PI-Math.PI/6)
                        startY: 50 + 25*Math.cos(progressshapePath.s*2*Math.PI-Math.PI/6)

                        PathArc{
                            x:50 - 25*Math.sin(progressshapePath.t*2*Math.PI)
                            y:50 + 25*Math.cos(progressshapePath.t*2*Math.PI)
                            radiusX: 25
                            radiusY: 25
                            direction: PathArc.Clockwise
                            useLargeArc: progressshapePath.t-progressshapePath.s+1/12>0.5?true:false
                        }
                    }
                }
            }

            //自定义busyIndicator2,颜色2
            Rectangle{
                id:busyIndicatortype2color2
                width: 100
                height: 100
                anchors.left: busyIndicatortype2color1.right
                anchors.leftMargin: 30
                anchors.verticalCenter: parent.verticalCenter
                color: "#00ff0000"
                SequentialAnimation{
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation{
                        target: progressshapePath2
                        property: "t"
                        from: 0
                        to: 0.75
                        duration: 600
                    }
                    NumberAnimation{
                        target: progressshapePath2
                        property: "t"
                        from: 0.75
                        to: 1
                        duration: 600
                    }
                }
                SequentialAnimation{
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation{
                        target: progressshapePath2
                        property: "s"
                        from: 0
                        to: 0.25
                        duration: 600
                    }
                    NumberAnimation{
                        target: progressshapePath2
                        property: "s"
                        from: 0.25
                        to: 1
                        duration: 600
                    }
                }

                Shape{
                    anchors.fill: parent
                    antialiasing: true
                    ShapePath{
                        id:progressshapePath2
                        property real t:0
                        property real s:0

                        strokeColor: "#a0ff5588"
                        strokeWidth: 6
                        strokeStyle: ShapePath.SolidLine
                        fillColor: "#00000000"
                        startX: 50 - 25*Math.sin(progressshapePath2.s*2*Math.PI-Math.PI/6)
                        startY: 50 + 25*Math.cos(progressshapePath2.s*2*Math.PI-Math.PI/6)

                        PathArc{
                            x:50 - 25*Math.sin(progressshapePath2.t*2*Math.PI)
                            y:50 + 25*Math.cos(progressshapePath2.t*2*Math.PI)
                            radiusX: 25
                            radiusY: 25
                            direction: PathArc.Clockwise
                            useLargeArc: progressshapePath2.t-progressshapePath2.s+1/12>0.5?true:false
                        }
                    }
                }
            }

            //还有一种可以控制progressindicator一圈回到的位置不是360度的地方
            //但是此方法有时会崩溃，有时间可以回头来研究
            Item{
                width: 0
                height: 0
            //     Rectangle{
            //         width: 300
            //         height: 300
            //         color: "#30ff0000"

            //         SequentialAnimation{
            //             id: seqnumt
            //             running: true
            //             loops: Animation.Infinite
            //             property int num:0
            //             NumberAnimation{
            //                 target: shapePath
            //                 property: "t"
            //                 from: seqnumt.num
            //                 to: 0.75+ seqnumt.num
            //                 duration: 800
            //             }
            //             NumberAnimation{
            //                 target: shapePath
            //                 property: "t"
            //                 from: 0.75+ seqnumt.num
            //                 to: 1+ seqnumt.num
            //                 duration: 800
            //                 // onFinished: seqnumt.numt = seqnumt.numt +1
            //             }
            //             PropertyAction {
            //                 target: seqnumt
            //                 property: "num"
            //                 value: seqnumt.num+1
            //             }
            //         }
            //         SequentialAnimation{
            //             id:seqnums
            //             running: true
            //             loops: Animation.Infinite
            //             property int num:0
            //             NumberAnimation{
            //                 target: shapePath
            //                 property: "s"
            //                 from: seqnums.num
            //                 to: 0.25+ seqnums.num
            //                 duration: 800
            //             }
            //             NumberAnimation{
            //                 target: shapePath
            //                 property: "s"
            //                 from: 0.25+ seqnums.num
            //                 to: 1+ seqnums.num
            //                 duration: 800

            //             }
            //             PropertyAction {
            //                 target: seqnums
            //                 property: "num"
            //                 value: seqnums.num+1
            //             }
            //         }

            //         Shape{
            //             anchors.fill: parent

            //             ShapePath{
            //                 id:shapePath
            //                 property real t:0
            //                 property real s:0

            //                 strokeColor: "#5000ff00"
            //                 strokeWidth: 6
            //                 strokeStyle: ShapePath.SolidLine
            //                 fillColor: "#00000000"
            //                 startX: 150 - 50*Math.sin(shapePath.s*1.2*2*Math.PI-Math.PI/6)
            //                 startY: 150 + 50*Math.cos(shapePath.s*1.2*2*Math.PI-Math.PI/6)
            //                 PathArc{
            //                     x:150 - 50*Math.sin(shapePath.t*1.2*2*Math.PI)
            //                     y:150 + 50*Math.cos(shapePath.t*1.2*2*Math.PI)
            //                     radiusX: 50
            //                     radiusY: 50
            //                     direction: PathArc.Clockwise
            //                     useLargeArc: shapePath.t*1.2-shapePath.s*1.2+1/12>0.5?true:false
            //                 }
            //             }
            //         }
            //     }
             }
        }
    }
    Shape{
        anchors.fill: parent
        ShapePath{
            strokeWidth: 0
            strokeColor: "#888888"
            strokeStyle: ShapePath.SolidLine
            startX: 40
            startY: busyIndicatorLay.y +busyIndicatorLay.height+20
            PathLine{
                x:40
                y:busyIndicatorLay.y +busyIndicatorLay.height+20
            }
            PathLine{
                x:parent.width-40
                y:busyIndicatorLay.y +busyIndicatorLay.height+20
            }
        }
    }
    Item{
        height: 20
    }


    Item{
        Layout.fillHeight: true
    }
}
