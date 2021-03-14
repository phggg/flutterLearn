import 'package:flutter/material.dart';

/// 如何获取Flutter应用维度生命周期
/// WidgetsBindingObserver：是一个Widgets绑定观察期，通过它我们可以监听应用的生命周期、语言的变化

class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    /// 添加Observer
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    /// 移除Observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print('state= $state');
    if(state == AppLifecycleState.paused) {
      print('App进入后台');
    } else if(state == AppLifecycleState.resumed) {
      print('App进入前台');
    } else if(state == AppLifecycleState.inactive) {
      /// 不常用：应用程序处于非活动状态，并且未接收用户输入时调用，比如：来了个电话
    }else if(state == AppLifecycleState.detached) {
      /// 不常用：表示flutter引擎脱离了宿主view，这个状态用到的比较少
    }
    super.didChangeAppLifecycleState(state);
  }
}
