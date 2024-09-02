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

            //其他自定义方法
            // Rectangle{
            //     width: 300
            //     height: 300
            //     color: "#30ff0000"

            //     Shape{
            //         anchors.fill: parent

            //         ShapePath{
            //             id:shapePath
            //             property real t:0
            //             property real s:0
            //             NumberAnimation on t{
            //                 from: 0
            //                 to: 1
            //                 duration: 1000
            //                 loops: Animation.Infinite
            //                 running: true
            //                 easing.type: Easing.OutQuint
            //             }
            //             NumberAnimation on s{
            //                 from: 0
            //                 to: 1
            //                 duration: 1000
            //                 loops: Animation.Infinite
            //                 running: true
            //                 easing.type: Easing.OutQuad
            //             }




            //             strokeColor: "#5000ff00"
            //             strokeWidth: 20
            //             strokeStyle: ShapePath.SolidLine
            //             fillColor: "#00000000"
            //             startX: 150 + 50*Math.cos(shapePath.s*2*Math.PI)
            //             startY: 150 + 50*Math.sin(shapePath.s*2*Math.PI)
            //             // PathMove{
            //             //     x:200 - 50*Math.cos(shapePath.t*2*Math.PI)
            //             //     y:150 + 50*Math.sin(shapePath.t*2*Math.PI)
            //             // }
            //             PathArc{
            //                 x:150 - 50*Math.sin(shapePath.t*2*Math.PI)
            //                 y:150 + 50*Math.cos(shapePath.t*2*Math.PI)
            //                 radiusX: 50
            //                 radiusY: 50
            //                 direction: PathArc.Clockwise
            //                 useLargeArc: false
            //                 // useLargeArc: true
            //             }
            //         }
            //     }
            // }
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

            //自定义busyIndicator1
            BusyIndicator {
                    id: busyIndicator
                    anchors.left: parent.left
                    anchors.leftMargin: 60
                    anchors.verticalCenter: parent.verticalCenter
                    implicitWidth: 72
                    implicitHeight: 72
                    running: true

                    contentItem: Item {
                        Rectangle {
                            id: rect
                            width: parent.width
                            height: parent.height
                            color: Qt.rgba(0, 0, 0, 0)
                            radius: width / 2
                            border.width: width / 6
                            visible: false
                        }

                        ConicalGradient {
                            width: rect.width
                            height: rect.height
                            gradient: Gradient {
                                GradientStop {
                                    position: 0.0
                                    color: "#ee80c342"
                                }
                                GradientStop {
                                    position: 1.0
                                    color: "#ee006325"
                                }
                            }
                            source: rect

                            Rectangle {
                                anchors.top: parent.top
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: rect.border.width
                                height: width
                                radius: width / 2
                                color: "#ee006325"
                            }

                            RotationAnimation on rotation {
                                from: 0
                                to: 360
                                duration: 1000
                                loops: Animation.Infinite
                                // easing.type: Easing.InOutQuad
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
