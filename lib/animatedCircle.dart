import 'package:flutter/material.dart';

class GlowCircle extends StatefulWidget {
  final bool circle;
  GlowCircle(this.circle);
  @override
  State<StatefulWidget> createState() {
    return _GlowCircle(circle);
  }
}

class _GlowCircle extends State<GlowCircle>
    with SingleTickerProviderStateMixin {
  _GlowCircle(this.circle);
  AnimationController animationController;
  final bool circle;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
    );
    var animation = Tween(begin: 1.0, end: 5.0).animate(animationController);
    animationController.addStatusListener(animationStatusListener);
    animationController.forward();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(const Duration(milliseconds: 500), () {
        animationController.reverse();
      });
    } else if (status == AnimationStatus.dismissed) {
      Future.delayed(const Duration(milliseconds: 500), () {
        animationController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        final size = circle
            ? 100 * (animationController.value + 1)
            : 200 / (animationController.value + 1);

        return Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(size / 2),
              ),
              color: circle ? Color(0xf0420047) : Colors.white38,
            ),
          ),
        );
      },
    );
  }
}
