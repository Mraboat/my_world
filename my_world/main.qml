import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts

ApplicationWindow {
    width: 1000
    height: 640
    visible: true
    title: qsTr("Hello World")

    //隐藏自带头部框
    //flags: Qt.Window|Qt.FramelessWindowHint

    background: Rectangle{
        anchors.fill: parent
        color: "#000000"
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        WorldHeaderView{

        }

        WorldBodyView{

        }
    }
}
