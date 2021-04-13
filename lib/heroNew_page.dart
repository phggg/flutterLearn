import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;

class Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const Photo({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material( /// 必须，定义动画所呈现的widget
        color: Theme.of(context).primaryColor.withOpacity(0.25),
        child: InkWell(
          onTap: onTap,
          child: LayoutBuilder(
            builder: (context, size) => Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          )
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final clipRectSize;
  final Widget child;

  const RadialExpansion({Key key, this.maxRadius, this.child}) :
        clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    print(clipRectSize);
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: child
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double KMinRadius = 32.0;
  static const double KMaxRadius = 128.0;
  /// 动画的差速器 动画运行的是 快出 缓慢进去
  static const opacityCurve = const Interval(0, 0.75, curve: Curves.fastOutSlowIn);
  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
  Widget _buildPage(BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: KMaxRadius * 2,
                height: KMaxRadius * 2,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(
                    maxRadius: KMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, String imageName, String description) {
    return Container(
      width: KMinRadius * 2,
      height: KMinRadius * 2,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: KMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: (){
              Navigator.of(context).push(
                PageRouteBuilder<void>( /// 用于生成一次性的路由
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return AnimatedBuilder( /// 页面切换淡入淡出
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),
                        );
                      }
                    );
                  }
                )
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Radial Hero Animation'),
          leading: BackButton(),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          alignment: FractionalOffset.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // _buildHero(context, 'https://img0.baidu.com/it/u=3225163326,3627210682&fm=26&fmt=auto&gp=0.jpg', 'Chair'),
              _buildHero(context, 'https://img1.baidu.com/it/u=2496571732,442429806&fm=26&fmt=auto&gp=0.jpg', 'Chair'),
              // _buildHero(context, 'https://img1.baidu.com/it/u=1709216491,2536617744&fm=26&fmt=auto&gp=0.jpg', 'Chair'),
            ],
          ),
        )
    );
  }
}

