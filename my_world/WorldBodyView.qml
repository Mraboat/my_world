import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts

RowLayout {
    width: parent.width
    Layout.fillWidth: true
    Layout.fillHeight: true
    //color: "#00000000"
    property int currentItem:1
    property int currentRepIndex:0

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
            //anchors.topMargin: 10
            //anchors.bottomMargin: 100
            Rectangle{
                id:rect1
                width: 200
                height: 50
                color: "#00000000"
                Text{
                    anchors.fill: parent
                    text: "基础控件"
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 13
                    color: "#ffffff"
                    anchors.leftMargin: 20
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: listview1.height === 0? listview1.height=120:listview1.height = 0
                }
            }
            ListView{
                id: listview1
                Layout.preferredHeight: 120
                Layout.fillWidth: true
                clip: true
                Behavior on height{
                    NumberAnimation{
                        duration: 500
                        easing.type: Easing.InOutBack
                    }
                }
                model: 3
                delegate: Rectangle{
                    width: 200
                    height: 40
                    color: "#00000000"
                    Text{
                        anchors.fill: parent
                        anchors.leftMargin: 40
                        text: index
                        verticalAlignment: Text.AlignVCenter
                        color: "#ffffff"
                        font.pointSize: 10
                    }
                }
            }
            Rectangle{
                id:rect2
                width: 200
                height: 50
                color: "#00000000"
                anchors.top: listview1.bottom
                Text{
                    anchors.fill: parent
                    text: "数据可视化"
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 13
                    color: "#ffffff"
                    anchors.leftMargin: 20
                    MouseArea{
                        anchors.fill: parent
                        onClicked: listview2.height === 0? listview2.height=120:listview2.height = 0
                    }
                }
            }
            ListView{
                id:listview2
                Layout.preferredHeight: 120
                Layout.fillWidth: true
                anchors.top: rect2.bottom
                clip: true
                Behavior on height{
                    NumberAnimation{
                        duration: 500
                        easing.type: Easing.InOutBack
                    }
                }
                model: 3
                delegate: Rectangle{
                    width: 200
                    height: 40
                    color: "#00000000"
                    Text{
                        anchors.fill: parent
                        anchors.leftMargin: 40
                        text: index
                        verticalAlignment: Text.AlignVCenter
                        color: "#ffffff"
                        font.pointSize: 10
                    }
                }
            }
            Rectangle{
                id:rect3
                width: 200
                height: 50
                color: "#00000000"
                anchors.top: listview2.bottom
                Text{
                    anchors.fill: parent
                    text: "其他"
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 13
                    color: "#ffffff"
                    anchors.leftMargin: 20
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: listview3.height === 0? listview3.height=120:listview3.height = 0
                }
            }
            ListView{
                id:listview3
                Layout.preferredHeight: 120
                Layout.fillWidth: true
                anchors.top: rect3.bottom
                clip: true
                Behavior on height{
                    NumberAnimation{
                        duration: 500
                        easing.type: Easing.InOutBack
                    }
                }
                model: 3
                delegate: Rectangle{
                    width: 200
                    height: 40
                    color: "#00000000"
                    Text{
                        anchors.fill: parent
                        anchors.leftMargin: 40
                        text: index
                        verticalAlignment: Text.AlignVCenter
                        color: "#ffffff"
                        font.pointSize: 10
                    }
                }
            }
            Item{
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width
            }
        }


        //备选一
    //     ColumnLayout{
    //         anchors.fill: parent
    //         ListView{
    //             id:mainListView
    //             Layout.fillHeight: true
    //             Layout.fillWidth: true
    //             model: ListModel{
    //                 id:mainListViewModel
    //                 ListElement{
    //                     name:"基础控件"
    //                     attributes:[
    //                         ListElement{number:0;content:"按钮"},
    //                         ListElement{number:0;content:"滑块"},
    //                         ListElement{number:0;content:"指示器"}
    //                     ]
    //                 }
    //                 ListElement{
    //                     name:"数据可视化"
    //                     attributes:[
    //                         ListElement{number:1;content:"按钮"},
    //                         ListElement{number:1;content:"滑块"}
    //                     ]
    //                 }
    //                 ListElement{
    //                     name:"其他"
    //                     attributes:[
    //                         ListElement{number:2;content:"按钮"}
    //                     ]
    //                 }
    //             }

    //             delegate: mainListViewDelegate
    //         }
    //     }
    // }

    // Component{
    //     id: mainListViewDelegate

    //     Rectangle{
    //         id: outside
    //         height: 50
    //         width: 200
    //         color: "#00000000"
    //         clip: true
    //         Behavior on height{
    //             NumberAnimation{duration: 200}
    //         }

    //         ColumnLayout{
    //             id:columnlay
    //             anchors.fill: parent
    //             Rectangle{
    //                 //id:rect1
    //                 width: parent.width*0.8
    //                 height: 50
    //                 radius: 20
    //                 color: "#00000000"
    //                 Text{
    //                     text: name
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 20
    //                     color: "#ffffff"
    //                     verticalAlignment: Text.AlignVCenter
    //                     font.pointSize: 13
    //                 }
    //                 MouseArea{
    //                     anchors.fill: parent
    //                     hoverEnabled: true
    //                     onClicked: outside.height===50?outside.height=50*(attributes.count+1)+10:outside.height=50
    //                     onEntered: parent.color = "#50ff0000"
    //                     onExited: parent.color = "#00000000"
    //                 }
    //             }

    //             Repeater{
    //                 id:repeater
    //                 model: attributes
    //                 Rectangle{
    //                     width: parent.width*0.8
    //                     height: 50
    //                     radius: 20
    //                     color: "#00000000"
    //                     property alias textColor: text.color
    //                     Text{
    //                         id:text
    //                         text: content
    //                         anchors.fill: parent
    //                         anchors.leftMargin: 40
    //                         color: "#ffffff"
    //                         verticalAlignment: Text.AlignVCenter
    //                     }

    //                     MouseArea{
    //                         id:mouseArea
    //                         anchors.fill: parent
    //                         hoverEnabled: true
    //                         onClicked: {
    //                             if(number!==mainListView.currentIndex){
    //                                 //console.log(mainListView.contentItem.childAt(0))
    //                                 mainListView.currentIndex = number
    //                                 currentRepIndex=0
    //                             }

    //                             repeater.itemAt(currentRepIndex).textColor = "#ffffff"
    //                             repeater.itemAt(index).textColor = "#00ff00"
    //                             currentRepIndex =index

    //                         }
    //                         onEntered: parent.color = "#50ff0000"
    //                         onExited: parent.color = "#00000000"
    //                     }
    //                 }
    //             }
    //         }
    //     }
    }
}
