import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_layout_page.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/less_group_page.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_app/plugin_use.dart';
import 'package:flutter_app/statefull_group_page.dart';

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
          _item('StateLessWidget与基础组件', LessGroupPage(), 'less'),
          _item('stateFulWidget与基础组件', StateGroupPage(), 'ful'),
          _item('Layout布局', FlutterLayoutPage(), 'layout'),
          _item('Plugin插件', PluginUse(), 'plugin'),
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
}
