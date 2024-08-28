import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts
import "./common"

ToolBar {
    width: parent.width
    Layout.fillWidth: true
    height: 30
    background: Rectangle{
        color: "#00000000"
    }
    //color: "red"
    RowLayout{
        anchors.fill: parent
        Image{
            height: 30
            width: 30
            sourceSize.width: 30
            sourceSize.height: 30
            //fillMode: Image.Stretch
            source: "qrc:/images/master.png"
        }
        Text{
            text: "MyWorld"
            color: "#ffffff"
            font.bold: true
            font.pointSize: 10
            //font.italic: true
            //verticalAlignment: Text.AlignVCenter
        }

        Item{
            height: parent.height
            Layout.fillWidth: true
        }
        WorldToolButton{
            iconSource: "qrc:/images/minimize-screen"
            toolTip: "最小化"
        }
        WorldToolButton{
            iconSource: "qrc:/images/full-screen"
            toolTip: "全屏"
        }
        WorldToolButton{
            iconSource: "qrc:/images/clear"
            toolTip: "关闭"
        }

    }
}
