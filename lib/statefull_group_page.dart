import 'package:flutter/material.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// stateFulWidget 基础组件
class StateGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stateFulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StateFulGroup(title: 'stateFulWidget与基础组件'),
    );
  }
}

class StateFulGroup extends StatefulWidget {
  StateFulGroup({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StateFulGroupState createState() => _StateFulGroupState();
}

class _StateFulGroupState extends State<StateFulGroup> {
  int _currentIndex = 0;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.blue),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.grey),
              activeIcon: Icon(Icons.list, color: Colors.blue),
              label: '列表',
            ),
          ]),
      floatingActionButton:
          FloatingActionButton(onPressed: null, child: Text('点我')),
      body: _currentIndex == 0
          ? RefreshIndicator(
              child: ListView(
                children: <Widget>[
                  Container(
                      child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'I am Text',
                                style: TextStyle(fontSize: 30),
                              ),
                              Icon(
                                Icons.android_outlined,
                                size: 50,
                                color: Colors.red,
                              ),
                              CloseButton(),
                              BackButton(),
                              Chip(
                                label: Text('小部件'),
                                avatar: Icon(Icons.people),
                              ),
                              Divider(
                                height: 30,
                                // 容器的高度，不是线的高度
                                thickness: 10,
                                // 线的高度
                                indent: 20,
                                // 左侧间距
                                endIndent: 20,
                                // 右侧间距
                                color: Colors.orange,
                              ),
                              Card(
                                // 带有圆角，阴影，边框等效果的卡片
                                color: Colors.blue,
                                elevation: 5, // 阴影
                                margin: EdgeInsets.all(10), // 上下左右都为10
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'I am Card',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              AlertDialog(
                                title: Text('盘他'),
                                content: Text('你这个糟老头子坏的很'),
                              ),
                              Image.network(
                                'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-abafac74ef7f916cc49b1de015744703_hd.jpg&refer=http%3A%2F%2Fpic1.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618145131&t=25df3b520a898f7cc626fcee1361dbd2',
                                width: 200,
                                height: 200,
                              ),
                              // TextField(
                              //   // 文本样式装饰器
                              //   decoration: InputDecoration(
                              //     contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              //     hintText: '请输入',
                              //     hintStyle: TextStyle(fontSize: 15)
                              //   ),
                              // ),
                              Container(
                                height: 100,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                                child: PageView(
                                  children: <Widget>[
                                    _item('Page1', Colors.deepPurple),
                                    _item('Page2', Colors.green),
                                    _item('Page3', Colors.red),
                                  ],
                                )
                              )
                            ],
                          )))
                ],
              ),
              onRefresh: _handleRefresh)
          : Text('第二个页面'),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
