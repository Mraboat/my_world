import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material as Me
import QtQuick.Layouts
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

ColumnLayout{

    RowLayout{
        id: buttonsLay
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
                text: "Buttons"
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

            //自定义按钮1
            Rectangle{
                //位置，待修改
                id:buttontype1
                anchors{
                    left: parent.left
                    leftMargin: 60
                    verticalCenter: parent.verticalCenter
                }

                width: 70
                height: 40
                radius: 10
                color: "#e055ee55"
                Behavior on color{
                    ColorAnimation{
                        duration: 100
                    }
                }

                Text{
                    anchors.centerIn: parent
                    text: "button"
                    color: "#ffffff"
                    font.bold: true
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = "#a055ee55"
                    }
                    onExited: {
                        parent.color = "#e055ee55"
                    }
                    onPressed: {
                        parent.scale = 0.95
                    }
                    onReleased: {
                        parent.scale = 1.0
                    }
                }

            }

            //自定义按钮2
            Rectangle{
                //位置，待修改
                id:buttontype2

                property color pos1 : Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                property color pos2 : Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                property color pos3 : Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                Behavior on pos1{
                    ColorAnimation{
                        duration: 2000
                    }
                }
                Behavior on pos2{
                    ColorAnimation{
                        duration: 2000
                    }
                }
                Behavior on pos3{
                    ColorAnimation{
                        duration: 2000
                    }
                }
                anchors{
                    left: buttontype1.right
                    leftMargin: 40
                    verticalCenter: parent.verticalCenter
                }

                width: 70
                height: 40
                radius: 10
                LinearGradient{
                    anchors.fill:parent
                    start:Qt.point(0,0)
                    end:Qt.point(parent.width,parent.height)
                    gradient: Gradient{
                        GradientStop{position:0.0;color:buttontype2.pos1}
                        GradientStop{position:0.5;color:buttontype2.pos2}
                        GradientStop{position:1.0;color:buttontype2.pos3}
                    }



                }
                Text{
                    anchors.centerIn: parent
                    text: "button"
                    color: "#ffffff"
                    font.bold: true
                }
                Timer{
                    interval: 2000
                    running: true
                    repeat: true
                    onTriggered: {
                        parent.pos1 = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                        parent.pos2 = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                        parent.pos3 = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                    }
                }

                visible: false
            }
            Rectangle{
                id:mask
                visible: false
                width: 70
                height: 40
                radius: 10
                color: window.mBACK_COLOR
            }
            ThresholdMask{

                anchors.fill: buttontype2
                source: buttontype2
                maskSource: mask
                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.scale = 0.95
                    }
                    onReleased: {
                        parent.scale = 1.0
                    }
                }
            }

            //自定义按钮3
            InnerShadow{
                property bool down:false
                anchors.fill: buttontype3
                source: buttontype3
                color: "#b0000000"
                radius: 2
                samples: 4
                horizontalOffset: down===false?0:-2
                verticalOffset: down===false?0:2
                // Behavior on horizontalOffset{
                //     NumberAnimation{
                //         duration: 50
                //     }
                // }
                // Behavior on verticalOffset{
                //     NumberAnimation{
                //         duration: 50
                //     }
                // }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        buttontype3.scale = buttontype3.scale===0.95?1.0:0.95
                        parent.down = !parent.down
                    }
                }
            }
            Rectangle{
                //位置，待修改
                id:buttontype3
                visible: false
                anchors{
                    left: buttontype2.right
                    leftMargin: 40
                    verticalCenter: parent.verticalCenter
                }
                width: 70
                height: 40
                radius: 10
                color: "#f0eeee55"
                Behavior on color{
                    ColorAnimation{
                        duration: 100
                    }
                }
                Text{
                    anchors.centerIn: parent
                    text: "button"
                    color: "#ffffff"
                    font.bold: true
                }
            }

            //自定义按钮4
            RectangularGlow{
                property bool hover: false
                anchors.fill: buttontype4
                color: "white"
                spread: 0.4
                glowRadius: hover===false?2:10
                cornerRadius: buttontype4.radius + glowRadius
                Behavior on glowRadius{
                    NumberAnimation{
                        duration: 200
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.hover = true
                    onExited: parent.hover = false
                    onPressed: buttontype4.scale = 0.95
                    onReleased: buttontype4.scale = 1.0
                }
            }
            Rectangle{
                //位置，待修改
                id:buttontype4
                //visible: false
                anchors{
                    left: buttontype3.right
                    leftMargin: 40
                    verticalCenter: parent.verticalCenter
                }
                width: 70
                height: 40
                radius: 10
                color: "#000000"
                Text{
                    anchors.centerIn: parent
                    text: "button"
                    color: "#ffffff"
                    font.bold: true
                }
            }

        }

        Item{
            Layout.fillWidth: true
        }
    }
    Shape{
        anchors.fill: parent
        ShapePath{
            strokeWidth: 0
            strokeColor: "#888888"
            strokeStyle: ShapePath.SolidLine
            startX: 40
            startY: buttonsLay.y +buttonsLay.height+20
            PathLine{
                x:40
                y:buttonsLay.y +buttonsLay.height+20
            }
            PathLine{
                x:parent.width-40
                y:buttonsLay.y +buttonsLay.height+20
            }
        }
    }
    Item{
        height: 20
    }

    RowLayout{
        id: groupBoxLay
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
                text: "CheckBox"
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

            // Me.ButtonGroup {
            //     id: childGroup
            //     exclusive: false; checkState: parentBox.checkState
            //     spa
            // }

            // Me.CheckBox {
            //     id: parentBox;
            //     height: 50
            //     text: qsTr("Parent"); checkState: childGroup.checkState
            // }
            CheckBox {
                id:option1
                hoverEnabled: false
                checked: true; text: qsTr("Child 1")
                height: 20
                indicator: Rectangle{
                    width: 20
                    height: 20
                    color: "#00000000"
                    border.color: "white"
                    border.width: 2
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.color = "#ff0000"
                    }
                }

                contentItem: Text {
                        text: option1.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: 100
                        font.pointSize: 12

                    }


                // leftPadding: indicator.width
            }

            // Me.CheckBox {
            //     id:option2
            //     height: 50
            //     anchors.top: option1.bottom
            //     text: qsTr("Child 2"); leftPadding: indicator.width
            //     ButtonGroup.group: childGroup
            // }


        }

        Item{
            Layout.fillWidth: true
        }
    }
    Shape{
        anchors.fill: parent
        ShapePath{
            strokeWidth: 0
            strokeColor: "#888888"
            strokeStyle: ShapePath.SolidLine
            startX: 40
            startY: groupBoxLay.y +groupBoxLay.height+20
            PathLine{
                x:40
                y:groupBoxLay.y +groupBoxLay.height+20
            }
            PathLine{
                x:parent.width-40
                y:groupBoxLay.y +groupBoxLay.height+20
            }
        }
    }
    Item{
        height: 20
    }

    RowLayout{
        id: radioButtonLay
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
                text: "RadioButton"
                font{
                    family: window.mFONT_FAMILY
                    pointSize: 18
                }
                color: "white"
                verticalAlignment: Text.AlignVCenter
            }
        }
        Item{
            Layout.fillWidth: true
        }
    }
    Shape{
        anchors.fill: parent
        ShapePath{
            strokeWidth: 0
            strokeColor: "#888888"
            strokeStyle: ShapePath.SolidLine
            startX: 40
            startY: radioButtonLay.y +radioButtonLay.height+20
            PathLine{
                x:40
                y:radioButtonLay.y +radioButtonLay.height+20
            }
            PathLine{
                x:parent.width-40
                y:radioButtonLay.y +radioButtonLay.height+20
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
