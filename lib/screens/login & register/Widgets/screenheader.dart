import 'package:flutter/cupertino.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class ScreenHeader extends StatefulWidget {
  const ScreenHeader({Key? key,required this.image}) : super(key: key);
   final image;
  @override
  State<ScreenHeader> createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return  ClipPath(
      clipper: ProsteThirdOrderBezierCurve(
        position: ClipPosition.bottom,
        list: [
          ThirdOrderBezierCurveSection(
            p1: Offset(0, 100),
            p2: Offset(0, 210),
            p3: Offset(MediaQuery.of(context).size.width, 150),
            p4: Offset(MediaQuery.of(context).size.width, 200),
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(200, 20, 10, 109),
        ),
        height: 200,
        child: Image.asset(
          widget.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
