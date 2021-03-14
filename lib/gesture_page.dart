import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {

  String printString = '';
  double moveX = 0;
  double moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
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
                      onTap: () => _printMsg('点击'),
                      onLongPress: () => _printMsg('长按'),
                      onTapCancel: () => _printMsg('取消'),
                      onTapUp: (e) => _printMsg('松开'),
                      onTapDown: (e) => _printMsg('按下'),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                            '点击测试',
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(printString)
                  ],
                ),
                Positioned(
                  left: moveX,
                  top: moveY,
                  child: GestureDetector( // GestureDetector在Flutter中负责处理跟用户的简单手势交互
                    onPanUpdate: (e) => _doMove(e),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  _printMsg (String msg) {
    setState(() {
      printString += ', $msg';
    });
  }

  _doMove (DragUpdateDetails e){
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }
}
