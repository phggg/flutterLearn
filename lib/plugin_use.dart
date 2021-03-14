import 'package:flutter/material.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

// class PluginUse extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '如何使用Flutter包和插件',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: '如何使用Flutter包和插件'),
//     );
//   }
// }

class PluginUse extends StatefulWidget {

  @override
  _PluginUseState createState() => _PluginUseState();
}

class _PluginUseState extends State<PluginUse> {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何使用Flutter包和插件'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'test color plugin1122',
              style: TextStyle(color: ColorUtil.color('899900')),
            ),
            ElevatedButton(
              onPressed: () => _lanuchURL(),
              child: Text(
                '打开浏览器',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () => _openMap(),
              child: Text(
                '打开地图',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )
      ),
    );
  }

  _lanuchURL () async {
    const url = 'https://flutter.io';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openMap () async {
    const url = 'geo: 52.32,4.917'; // APP提供者提供的 schema
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      // IOS
      const url = 'http://maps.apple.com/?ll=52.32,4.917';
      if(await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not lanuch $url';
      }
    }
  }
}
