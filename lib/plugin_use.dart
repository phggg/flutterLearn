import 'package:flutter/material.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class PluginUse extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何使用Flutter包和插件',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '如何使用Flutter包和插件'),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'test color plugin1122',
              style: TextStyle(color: ColorUtil.color('899900')),
            ),
          ],
        )
      ),
    );
  }


}
