import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts
import QtQuick.Shapes

ColumnLayout{
    // Item{
    //     height: 20
    // }

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
                text: "GroupBox"
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
