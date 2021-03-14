import 'package:flutter/material.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

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
/// 如何导入和使用flutter的资源文件
class ResPage extends StatefulWidget {
  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
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
              Image(
                image: AssetImage('images/avatar.png'),
                width: 100,
                height: 100,
              )
            ],
          )
      ),
    );
  }


}
