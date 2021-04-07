import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp>{
  // Animation<double> animation;
  // AnimationController controller;
  // AnimationStatus animationStatus;
  // double animationValue;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
  //   animation = Tween<double>(begin: 0, end: 300).animate(controller)
  //   ..addListener(() {
  //     setState(() {
  //       animationValue = animation.value;
  //     });
  //   })
  //   ..addStatusListener((AnimationStatus state) {
  //     setState(() {
  //       setState(() {
  //         animationStatus = state;
  //       });
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('天眼查专业版'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '点击测试',
                    ),
                  ),
                ),
                Text('112212')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
