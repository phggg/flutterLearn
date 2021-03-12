import 'package:flutter/material.dart';
import 'package:flutter_app/function_learn.dart';
import 'package:flutter_app/less_group_page.dart';
import 'package:flutter_app/oop_learn.dart';
import 'package:flutter_app/plugin_use.dart';
import 'package:flutter_app/statefull_group_page.dart';

void main() {
  runApp(StateGroupPage());
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
      home: MyHomePage(title: 'FlutterLesson'),
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
  Widget build(BuildContext context) {
    // _oopLearn();
    _functionLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }

  void _oopLearn() {
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2);
    
    print(Student.doPrint('112312'));
    Student stu = Student('a', 'b', 13, city: 'wdawdwa');
    print(stu);
    print(stu.school);
    stu.school = 'vvv';
    print(stu.school);
    print(stu.toString());

    StudyFlutter studyFlutter = StudyFlutter();
    studyFlutter.study();
  }

  void _functionLearn () {
    TestFunction testFunction = TestFunction();
    testFunction.start();
  }
}
