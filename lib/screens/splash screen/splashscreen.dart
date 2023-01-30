import 'package:demo_project/Animation/AnimationTranstion.dart';
import 'package:demo_project/contatnts.dart';
import 'package:demo_project/screens/login%20&%20register/loginscreen.dart';
import 'package:demo_project/screens/login%20&%20register/welcome.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 3),
              builder: (BuildContext context, double opacity, Widget? child) {
                return AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(seconds: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/asoslogo.png',
                          width: MediaQuery.of(context).size.width - 20),
                      const SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(
                        color: Constants.thirdColor,
                      ),
                    ],
                  ),
                );
              },
              onEnd: () async {
                await Future.delayed(
                  Duration(seconds: 2),
                  () => Navigator.pushReplacement(
                      context, AnimationTransition(page: const WelcomeScreen())),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
