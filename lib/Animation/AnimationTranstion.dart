import 'package:flutter/cupertino.dart';

class AnimationTransition extends PageRouteBuilder {
  final page;

  AnimationTransition({this.page})
      : super(
            pageBuilder: (context, animation, animation2) => page,
            transitionsBuilder: (context, animation, animation2, child) {
              var begin = Offset(0, -1);
              var end = Offset(0, 0);
              var tween = Tween(begin: begin, end: end);
              var curveanimate =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return SlideTransition(
                position: tween.animate(curveanimate),
                child: child,

              );
            });
}
