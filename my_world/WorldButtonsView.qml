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
        id: checkBoxLay
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

            CheckBox {
                id:option1
                hoverEnabled: false
                text: qsTr("Option 1")
                height: 22
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.top: parent.top
                anchors.topMargin: 3
                indicator: Rectangle{

                    width: 22
                    height: 22
                    color: "#00000000"
                    border.color: "white"
                    border.width: 2
                    Image{
                        anchors.fill: parent
                        source: option1.checkState===Qt.Checked?"qrc:/images/redduigou":""
                    }
                }

                contentItem: Text {
                        text: option1.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: parent.indicator.width + 20
                        font{
                            pointSize: 13
                            bold: true
                        }


                    }
            }

            CheckBox {
                id:option2
                hoverEnabled: false
                text: qsTr("Option 2")
                height: 22
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.top: option1.bottom
                anchors.topMargin: 15
                indicator: Rectangle{

                    width: 22
                    height: 22
                    color: "#00000000"
                    border.color: "white"
                    border.width: 2
                    Image{
                        anchors.fill: parent
                        source: option2.checkState===Qt.Checked?"qrc:/images/greenduigou":""
                    }
                }

                contentItem: Text {
                        text: option2.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: parent.indicator.width + 20
                        font{
                            pointSize: 13
                            bold: true
                        }


                    }
            }

            CheckBox {
                id:option3
                hoverEnabled: false
                text: qsTr("Option 3")
                height: 22
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.top: option2.bottom
                anchors.topMargin: 15
                indicator: Rectangle{

                    width: 22
                    height: 22
                    color: "#00000000"
                    border.color: "white"
                    border.width: 2
                    Image{
                        anchors.fill: parent
                        source: option3.checkState===Qt.Checked?"qrc:/images/blueduigou":""
                    }
                }

                contentItem: Text {
                        text: option3.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: parent.indicator.width + 20
                        font{
                            pointSize: 13
                            bold: true
                        }


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
            startY: checkBoxLay.y +checkBoxLay.height+20
            PathLine{
                x:40
                y:checkBoxLay.y +checkBoxLay.height+20
            }
            PathLine{
                x:parent.width-40
                y:checkBoxLay.y +checkBoxLay.height+20
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
        Rectangle{
            height: parent.height
            width: 480
            color: "#00000000"

            RadioButton {
                id:ra_option1
                text: qsTr("Option 1")
                height: 22
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.top: parent.top
                anchors.topMargin: 3
                indicator: Rectangle{

                    width: 22
                    height: 22
                    radius: 22
                    color: "#00000000"
                    border.color: "white"
                    border.width: 2
                    // Image{
                    //     anchors.fill: parent
                    //     source: ra_option1.checked?"qrc:/images/redduigou":""
                    // }
                    Rectangle{
                        anchors.centerIn: parent
                        width: 12
                        height: 12
                        radius: 12
                        color: "white"
                        visible: ra_option1.checked
                    }
                }

                contentItem: Text {
                    text: ra_option1.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: parent.indicator.width + 20
                    font{
                        pointSize: 13
                        bold: true
                    }
                }
            }
            RadioButton {
                id:ra_option2
                //hoverEnabled: false
                text: qsTr("Option 2")
                height: 22
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.top: ra_option1.bottom
                anchors.topMargin: 15
                indicator: Rectangle{

                    width: 22
                    height: 22
                    radius: 22
                    color: "#00000000"
                    border.color: "white"
                    border.width: 2
                    Rectangle{
                        anchors.centerIn: parent
                        width: 12
                        height: 12
                        radius: 12
                        color: "white"
                        visible: ra_option2.checked
                    }
                }

                contentItem: Text {
                    text: ra_option2.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: parent.indicator.width + 20
                    font{
                        pointSize: 13
                        bold: true
                    }


                }

            }
            RadioButton {
                id:ra_option3
                //hoverEnabled: false
                text: qsTr("Option 3")
                height: 22
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.top: ra_option2.bottom
                anchors.topMargin: 15
                indicator: Rectangle{

                    width: 22
                    height: 22
                    radius: 22
                    color: "#00000000"
                    border.color: "white"
                    border.width: 2
                    Rectangle{
                        anchors.centerIn: parent
                        width: 12
                        height: 12
                        radius: 12
                        color: "white"
                        visible: ra_option3.checked
                    }
                }

                contentItem: Text {
                    text: ra_option3.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: parent.indicator.width + 20
                    font{
                        pointSize: 13
                        bold: true
                    }


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

    RowLayout{
        id:switchLay
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
                text: "Switch"
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

            Switch{
                id:switch1
                text: "Switch"
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter

                contentItem: Text{
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: parent.indicator.right
                    anchors.leftMargin: 10
                    font{
                        pointSize: 13
                        bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: switch1.checked = !switch1.checked
                    }
                }
            }

            Switch{
                id:switch2
                text: "Switch"
                anchors.left: switch1.right
                anchors.leftMargin: 120
                anchors.verticalCenter: parent.verticalCenter
                indicator: Rectangle{
                    anchors.verticalCenter: parent.verticalCenter
                    width: 44
                    height: 15
                    radius: 15
                    color: "#555555"
                    //border.color: "white"
                    //border.width: 2
                    Rectangle{
                        width: switch2yuan.x + switch2yuan.width
                        height: 15
                        radius: 15
                        color: "pink"
                    }

                    Rectangle{
                        // anchors.centerIn: parent
                        y:(parent.height - height)/2
                        id:switch2yuan
                        x: switch2.checked?parent.width - width:0
                        width: 20
                        height: 20
                        radius: 20
                        color: "#8888ff"
                        Behavior on x{
                            NumberAnimation{
                                duration: 300
                            }
                        }

                    }
                }
                contentItem: Text{
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: parent.indicator.right
                    anchors.leftMargin: 10
                    font{
                        pointSize: 13
                        bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: switch2.checked = !switch2.checked
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
            startY: switchLay.y +switchLay.height+20
            PathLine{
                x:40
                y:switchLay.y +switchLay.height+20
            }
            PathLine{
                x:parent.width-40
                y:switchLay.y +switchLay.height+20
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
