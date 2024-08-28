import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts

ToolButton {
    id: self

    property string iconSource: ""
    property string toolTip: ""

    icon.source: iconSource

    ToolTip.visible: hovered
    ToolTip.text: toolTip

    background: Rectangle{
        color: self.down?"#eeeeee":"#00000000"
    }
    icon.color: self.down?"#00000000":"#eeeeee"
}
