import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_layout_page.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/less_group_page.dart';
import 'package:flutter_app/logo_page.dart';
import 'package:flutter_app/animation_logo.dart';
import 'package:flutter_app/test_page.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_app/photo_app_page.dart';
import 'package:flutter_app/plugin_use.dart';
import 'package:flutter_app/res_page.dart';
import 'package:flutter_app/statefull_group_page.dart';

import 'app_lifecycle.dart';
import 'flutter_widget_lifecycle.dart';
import 'gesture_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark, // 夜间模式
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由和导航'),
        ),
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StateGroupPage(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'plugin': (BuildContext context) => PluginUse(),
        'gesture': (BuildContext context) => GesturePage(),
        'res': (BuildContext context) => ResPage(),
        'widgetLifecycle': (BuildContext context) => WidgetLifecycle(),
        'AppLifecycle': (BuildContext context) => AppLifecycle(),
        'PhotoApp': (BuildContext context) => PhotoApp(),
        'LogoApp': (BuildContext context) => LogoApp(),
        'TestApp': (BuildContext context) => TestApp(),
        'AnimatedLogo': (BuildContext context) => AnimatedLogo(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigator createState() => _RouteNavigator();
}

class _RouteNavigator extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    _oopLearn();
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? '' : '不'}通过路由名跳转'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            }
          ),
          Text('aaa'),
          _item('StateLessWidget与基础组件', LessGroupPage(), 'less'),
          _item('stateFulWidget与基础组件', StateGroupPage(), 'ful'),
          _item('Layout布局', FlutterLayoutPage(), 'layout'),
          _item('Plugin插件', PluginUse(), 'plugin'),
          _item('如何检测用户手势以及处理点击事件', GesturePage(), 'gesture'),
          _item('如何导入和使用flutter的资源文件', ResPage(), 'res'),
          _item('flutter页面的生命周期', WidgetLifecycle(), 'widgetLifecycle'),
          _item('flutter应用的生命周期', AppLifecycle(), 'AppLifecycle'),
          _item('拍照APP开发', PhotoApp(), 'PhotoApp'),
          _item('动画入门', LogoApp(), 'LogoApp'),
          _item('TestApp', TestApp(), 'TestApp'),
          _item('AnimatedLogo', AnimatedLogo(), 'AnimatedLogo'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if(byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
        style: ButtonStyle(animationDuration: Duration(seconds: 0)),
      ),
    );
  }

  void _oopLearn(){
    Logger log1 = Logger();
    Logger log2 = Logger();
    // print(log1 == log2);
    Student s1 = Student('1','2',3, country: 'alibaba', city: 'dingding');
    print(s1);
  }
}
