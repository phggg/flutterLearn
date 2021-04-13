import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo, /// 必须，用于关联两个Hero动画的标识
        /// createRectTween 可选，定义目标Hero的边界，在从起始位置到目的位置的'飞行'过程中该如何变化
        child: Material( /// 必须，定义动画所呈现的widget
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
        leading: BackButton(),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'https://img0.baidu.com/it/u=3225163326,3627210682&fm=26&fmt=auto&gp=0.jpg',
          width: 300.0,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
             Scaffold(
              appBar: AppBar(
                title: const Text('Flippers Page'),
              ),
               body: Container(
                 color: Colors.limeAccent,
                 padding: EdgeInsets.all(16),
                 alignment: Alignment.topLeft,
                 child: PhotoHero(
                   photo: 'https://img0.baidu.com/it/u=3225163326,3627210682&fm=26&fmt=auto&gp=0.jpg',
                   width: 100,
                   onTap: () {
                     Navigator.of(context).pop();
                   },
                 ),
               )
            )));
          },
        ),
      )
    );
  }
}

