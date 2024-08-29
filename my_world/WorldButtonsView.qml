import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts
import QtQuick.Shapes

ColumnLayout{
    Item{
        height: 20
    }

    RowLayout{
        id: buttonsLay
        height: 100
        Rectangle {
            //Layout.
            height: parent.height
            width: 200
            color: "#50ffffff"
            Text{
                width: 200
                height: 200
                text: "按钮"
                font{
                    // family: window.mFONT_FAMILY
                    pointSize: 17
                    //bold: true
                    weight: 700
                }
                // font: Font{pointSize:16}
                // font.weight: 200
                // font.pointSize: 15

                color: "white"
            }
        }
    }
    Shape{
        anchors.fill: parent
        ShapePath{
            strokeWidth: 0
            strokeColor: "#ffffff"
            strokeStyle: ShapePath.SolidLine
            startX: 0
            startY: buttonsLay.y +buttonsLay.height+5
            PathLine{
                x:0
                y:buttonsLay.y +buttonsLay.height+5
            }
            PathLine{
                x:parent.width
                y:buttonsLay.y +buttonsLay.height+5
            }
        }
    }

    Item{
        Layout.fillHeight: true
    }


}
