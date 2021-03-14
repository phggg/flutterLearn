import 'package:flutter/material.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// StatelessWidget 基础组件
class LessGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'StatelessWidget与基础组件'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: Center(
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
                  )
                ],
              ))),
    );
  }
}
