import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        setState(() {
          setState(() {
            animationStatus = state;
          });
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  controller.reset();
                  controller.forward();
                },
                child: Text('Start', textDirection: TextDirection.ltr),
              ),
              Text('State: ' + animationStatus.toString(),
                  textDirection: TextDirection.ltr),
              Text('Value: ' + animationValue.toString(),
                  textDirection: TextDirection.ltr),
              Container(
                height: animation.value,
                width: animation.value,
                child: FlutterLogo(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
