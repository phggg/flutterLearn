import 'package:flutter/material.dart';

/// Flutter Widget的生命周期重点讲解StatefulWidget的生命周期
/// 因为无状态的widget StateLessWidget只有createElement与build两个生命周期方法
/// StatefulWidget的生命周期方法按照时期不同可以分为三组
/// 1.初始化时期
/// createState、initState
/// 2.更新期间
/// didChangeDependencies、build、didUpdateWidget
/// 3.销毁期
/// deactivate、dispose

class WidgetLifecycle extends StatefulWidget {
  /// 当我们构建一个新的StatefulWidget时，createState会立刻调用
  /// 并且createState必须重写
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    print('---initState---');
    super.initState();
  }

  /// 当依赖的State对象改变时会调用：
  /// a.在第一次构建widget时，在initState()之后立即调用此方法；
  /// b.如果StatefulWidgets依赖于InheritedWidget，那么当当前的State所依赖的InheritedWidget中的变量改变时会再次调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('---didChangeDependencies---');
    super.didChangeDependencies();
  }

  /// 不常用到，当父组件需要重新绘制时才会调用
  /// 该方法携带一个oldWidget，可以将其与当前的widget进行对比以便进行一些额外的逻辑
  /// if(oldWidget.xxx != widget.xxx) ...
  @override
  void didUpdateWidget(covariant WidgetLifecycle oldWidget) {
    // TODO: implement didUpdateWidget
    print('---didUpdateWidget---');
    super.didUpdateWidget(oldWidget);
  }

  /// 很少使用，在组件被移除时调用
  /// 在dispose之前调用
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  /// 常用，组件被销毁时调用
  /// 通常在该方法中执行一些资源的释放工作，比如监听器的写在，channel的销毁等
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  /// 这是一个必须实现的方法，在这里实现要呈现的页面内容
  /// 它会在didChangeDependencies之后立即调用
  /// 另外当调用setState后也会再次调用该方法
  @override
  Widget build(BuildContext context) {
    print('---build---');
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter页面生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text(
                '点击',
                style: TextStyle(fontSize: 26),
              ),
              onPressed: () {
                setState(() {
                  _count++;
                });
              }
            ),
            Text('$_count')
          ],
        ),
      ),
    );
  }
}
