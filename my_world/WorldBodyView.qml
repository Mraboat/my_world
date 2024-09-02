import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts

RowLayout {
    width: parent.width
    Layout.fillWidth: true
    Layout.fillHeight: true
    //color: "#00000000"

    property int loaderIndex: 0

    property var basicList:[
        {value:"Buttons",qml:"WorldButtonsView"},
        {value:"DialogBoxes",qml:"WorldDialogBoxesView"},
        {value:"Other",qml:"WorldBasicOtherView"}
    ]
    property var chartList:[
        {value:"PieChart",qml:"WorldPieChartView"},
        {value:"DialogBoxes",qml:"WorldDialogBoxesView"},
        {value:"Other",qml:"WorldBasicOtherView"}
    ]

    Frame{
        Layout.fillHeight: true
        Layout.preferredWidth: 200
        contentWidth: 200
        background: Rectangle{
            color: "#30ffd0d0"
        }

        contentItem:
        ColumnLayout{
            anchors.fill: parent
            spacing: 0

            Rectangle{
                id:rect1
                width: 200
                height: 50
                color: "#00000000"
                RowLayout{
                    anchors.fill: parent
                    spacing: 0
                    Item{
                        width: 10
                    }

                    Image{
                        id: zhediejiantou1
                        source: "qrc:/images/zhediejiantou"
                        width: 30
                        height: 30
                        sourceSize.width: 30
                        sourceSize.height: 30
                        Behavior on rotation {
                            NumberAnimation{
                                duration: 300
                            }
                        }
                    }
                    Item{
                        width: 5
                    }

                    Text{
                        text: "基础控件"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                        font.family: window.mFONT_FAMILY
                        color: "#ffffff"
                    }
                    Item{
                        Layout.fillWidth: true
                    }
                }


                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listview1.height === 0? listview1.height=120:listview1.height = 0
                        zhediejiantou1.rotation === -90?zhediejiantou1.rotation = 0:zhediejiantou1.rotation = -90
                    }
                }
            }
            ListView{
                id: listview1
                property string highlightColor:"#00000000"
                Layout.preferredHeight: 120
                Layout.fillWidth: true
                clip: true
                Behavior on height{
                    NumberAnimation{
                        duration: 300
                        //easing.type: Easing.InOutBack
                    }
                }
                model: ListModel{
                    id:listview1Model
                }
                highlight: Rectangle{
                    color: listview1.highlightColor
                    radius: 5
                }

                delegate: Rectangle{
                    property string textColor: "#ffffff"
                    width: 200
                    height: 40
                    radius: 5
                    color: "#00000000"
                    Text{
                        anchors.fill: parent
                        anchors.leftMargin: 40
                        text: value
                        verticalAlignment: Text.AlignVCenter
                        color: parent.textColor
                        font.pointSize: 10
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.color = "#50ff0000"
                        onExited: parent.color = "#00000000"
                        onClicked: {
                            //右侧界面显示
                            repeater.itemAt(loaderIndex).visible = false
                            var loader = repeater.itemAt(index)
                            loader.visible = true
                            loader.source = basicList[index].qml+".qml"
                            loaderIndex = index

                            //清除其他列表选中颜色
                            for(var i =0;i<listview2.count;i++){
                                listview2.itemAtIndex(i).textColor = "#ffffff"
                            }
                            for(var j =0;i<listview3.count;j++){
                                listview3.itemAtIndex(j).textColor = "#ffffff"
                            }
                            //设置其他初始位置，归0
                            listview2.currentIndex = 0
                            listview3.currentIndex = 0
                            //清除其他列表高亮
                            listview2.highlightColor = "#00000000"
                            listview3.highlightColor = "#00000000"
                            //显示自己高亮颜色
                            listview1.highlightColor = "#50ff0000"
                            //显示自己字体颜色
                            listview1.itemAtIndex(listview1.currentIndex).textColor = "#ffffff"
                            parent.textColor = "#eeee55"
                            listview1.currentIndex = index
                        }
                    }
                }
            }
            Rectangle{
                id:rect2
                width: 200
                height: 50
                color: "#00000000"
                anchors.top: listview1.bottom
                RowLayout{
                    anchors.fill: parent
                    spacing: 0
                    Item{
                        width: 10
                    }

                    Image{
                        id: zhediejiantou2
                        source: "qrc:/images/zhediejiantou"
                        width: 30
                        height: 30
                        sourceSize.width: 30
                        sourceSize.height: 30
                        Behavior on rotation {
                            NumberAnimation{
                                duration: 300
                            }
                        }
                    }
                    Item{
                        width: 5
                    }

                    Text{
                        text: "数据可视化"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                        font.family: window.mFONT_FAMILY
                        color: "#ffffff"
                    }
                    Item{
                        Layout.fillWidth: true
                    }
                }


                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listview2.height === 0? listview2.height=120:listview2.height = 0
                        zhediejiantou2.rotation === -90?zhediejiantou2.rotation = 0:zhediejiantou2.rotation = -90
                    }
                }
            }
            ListView{
                id:listview2
                property string highlightColor:"#00000000"
                Layout.preferredHeight: 120
                Layout.fillWidth: true
                anchors.top: rect2.bottom
                clip: true
                Behavior on height{
                    NumberAnimation{
                        duration: 300
                        //easing.type: Easing.InOutBack
                    }
                }
                model: ListModel{
                    id:listview2Model
                }
                highlight: Rectangle{
                    id: highlightRect2
                    color: listview2.highlightColor
                    radius: 5
                }
                delegate: Rectangle{
                    property string textColor: "#ffffff"
                    width: 200
                    height: 40
                    radius: 5
                    color: "#00000000"
                    Text{
                        anchors.fill: parent
                        anchors.leftMargin: 40
                        text: value
                        verticalAlignment: Text.AlignVCenter
                        color: parent.textColor
                        font.pointSize: 10
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.color = "#50ff0000"
                        onExited: parent.color = "#00000000"
                        onClicked: {
                            repeater.itemAt(loaderIndex).visible = false
                            var loader = repeater.itemAt(index + listview1.count)
                            loader.visible = true
                            loader.source = chartList[index].qml+".qml"
                            loaderIndex = index + listview1.count

                            for(var i =0;i<listview1.count;i++){
                                listview1.itemAtIndex(i).textColor = "#ffffff"
                            }
                            for(var j =0;i<listview3.count;j++){
                                listview3.itemAtIndex(j).textColor = "#ffffff"
                            }
                            listview1.currentIndex = 0
                            listview3.currentIndex = 0
                            listview1.highlightColor = "#00000000"
                            listview3.highlightColor = "#00000000"
                            listview2.highlightColor = "#50ff0000"
                            listview2.itemAtIndex(listview2.currentIndex).textColor = "#ffffff"
                            parent.textColor = "#eeee55"
                            listview2.currentIndex = index
                        }
                    }
                }
            }
            Rectangle{
                id:rect3
                width: 200
                height: 50
                color: "#00000000"
                anchors.top: listview2.bottom
                RowLayout{
                    anchors.fill: parent
                    spacing: 0
                    Item{
                        width: 10
                    }

                    Image{
                        id: zhediejiantou3
                        source: "qrc:/images/zhediejiantou"
                        width: 30
                        height: 30
                        sourceSize.width: 30
                        sourceSize.height: 30
                        Behavior on rotation {
                            NumberAnimation{
                                duration: 300
                            }
                        }
                    }
                    Item{
                        width: 5
                    }

                    Text{
                        text: "其他"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                        font.family: window.mFONT_FAMILY
                        color: "#ffffff"
                    }
                    Item{
                        Layout.fillWidth: true
                    }
                }


                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listview3.height === 0? listview3.height=120:listview3.height = 0
                        zhediejiantou3.rotation === -90?zhediejiantou3.rotation = 0:zhediejiantou3.rotation = -90
                    }
                }
            }
            ListView{
                id:listview3
                property string highlightColor:"#00000000"
                Layout.preferredHeight: 120
                Layout.fillWidth: true
                anchors.top: rect3.bottom
                clip: true
                Behavior on height{
                    NumberAnimation{
                        duration: 300
                        //easing.type: Easing.InOutBack
                    }
                }
                model: 3
                highlight: Rectangle{
                    id: highlightRect3
                    color: listview3.highlightColor
                    radius: 5
                }
                delegate: Rectangle{
                    property string textColor: "#ffffff"
                    width: 200
                    height: 40
                    radius: 5
                    color: "#00000000"
                    Text{
                        anchors.fill: parent
                        anchors.leftMargin: 40
                        text: index
                        verticalAlignment: Text.AlignVCenter
                        color: parent.textColor
                        font.pointSize: 10
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.color = "#50ff0000"
                        onExited: parent.color = "#00000000"
                        onClicked: {
                            for(var i =0;i<listview2.count;i++){
                                listview2.itemAtIndex(i).textColor = "#ffffff"
                            }
                            for(var j =0;i<listview1.count;j++){
                                listview1.itemAtIndex(j).textColor = "#ffffff"
                            }
                            listview2.currentIndex = 0
                            listview1.currentIndex = 0
                            listview2.highlightColor = "#00000000"
                            listview1.highlightColor = "#00000000"

                            listview3.highlightColor = "#50ff0000"


                            listview3.itemAtIndex(listview3.currentIndex).textColor = "#ffffff"
                            parent.textColor = "#eeee55"
                            listview3.currentIndex = index
                        }
                    }
                }
            }
            Item{
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width
            }
        }

        Component.onCompleted: {
            listview1Model.append(basicList)
            listview2Model.append(chartList)

            //当前测试
            var loader = repeater.itemAt(2)
            loader.visible = true
            loader.source = basicList[2].qml+".qml"
            loaderIndex = 2
        }
    }

    Repeater{
        id:repeater
        model: basicList.length + chartList.length
        Loader{
            visible: false
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
