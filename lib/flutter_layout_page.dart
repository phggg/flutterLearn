import 'package:flutter/material.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// 如何进行flutter布局开发
// class FlutterLayoutPage extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'stateFulWidget与基础组件',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: StateFulGroup(title: 'stateFulWidget与基础组件'),
//     );
//   }
// }

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
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
                              AlertDialog(
                                title: Text('盘他'),
                                content: Text('你这个糟老头子坏的很11'),
                              ),
                              Row(
                                children: <Widget>[
                                  ClipOval(
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(
                                          'https://www.devio.org/img/avatar.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      // borderRadius: BorderRadius.circular(10),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Image.network(
                                          'https://www.devio.org/img/avatar.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 100,
                                margin: EdgeInsets.all(10),
                                // decoration: BoxDecoration(
                                //   color: Colors.lightBlueAccent
                                // ),
                                child: PhysicalModel(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.antiAlias, // 抗锯齿
                                    child: PageView(
                                      children: <Widget>[
                                        _item('Page1', Colors.deepPurple),
                                        _item('Page2', Colors.green),
                                        _item('Page3', Colors.red),
                                      ],
                                    )),
                              ),
                              Column(
                                children: <Widget>[
                                  FractionallySizedBox(
                                      widthFactor: 1,
                                      child: Container(
                                        decoration:
                                            BoxDecoration(color: Colors.green),
                                        child: Text(
                                          '宽度撑满',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ))
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Image.network(
                                      'https://www.devio.org/img/avatar.png',
                                      width: 100,
                                      height: 100),
                                  Positioned(
                                      left: 0,
                                      bottom: 0,
                                      child: Image.network(
                                        'https://www.devio.org/img/avatar.png',
                                        width: 36,
                                        height: 36,
                                      ))
                                ],
                              ),
                              Wrap(
                                spacing: 8, // 水平间距
                                runSpacing: 6, // 垂直间距
                                children: <Widget>[
                                  _chip('Flutter'),
                                  _chip('进阶'),
                                  _chip('实战'),
                                  _chip('携程'),
                                  _chip('APP'),
                                ],
                              )
                            ],
                          )))
                ],
              ),
              onRefresh: _handleRefresh)
          : Column(
              children: <Widget>[
                Text('列表'),
                Expanded(
                    // 填充y轴方向可用的空间
                    child: Container(
                  color: Colors.red,
                  child: Text('拉满高度'),
                ))
              ],
            ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 3000));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
