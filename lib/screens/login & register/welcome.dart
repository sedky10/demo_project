
import 'package:demo_project/contatnts.dart';
import 'package:demo_project/screens/login%20&%20register/loginscreen.dart';
import 'package:demo_project/screens/login%20&%20register/register.dart';

import 'package:flutter/material.dart';

import 'Widgets/buttonin.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.secondryColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [
              .01,
              .9,
            ],
            colors: [
              Constants.secondryColor,
              Constants.primaryColor,
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/clothes.png', height: 200),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: const [
                      Text(
                        'Asos',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 5,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Style is something each of us already has, all we need to do is find it , let us to find it with you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          wordSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ButtonIn(pagename: 'LogIn', page: Login()),
                const ButtonIn(pagename: 'Sign up', page: Register()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
