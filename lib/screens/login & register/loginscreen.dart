import 'package:demo_project/Animation/righttransition.dart';
import 'package:demo_project/screens/Navigation/Navigation.dart';
import 'package:demo_project/screens/login%20&%20register/Widgets/screenheader.dart';
import 'package:demo_project/screens/login%20&%20register/register.dart';
import 'package:demo_project/screens/login%20&%20register/welcome.dart';
import 'package:flutter/material.dart';

import '../../contatnts.dart';
import '../Home/home.dart';
import 'Widgets/buttonin.dart';
import 'Widgets/inputfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff5756),
      body: SafeArea(
        child: Container(
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
          child: Stack(
            children: [
              Column(
                children: [
                  const ScreenHeader(
                      image:
                          'assets/images/header.jpg'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Welcome back'.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: 3,
                            ),
                          ),
                          Text(
                            'login to your account'.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              letterSpacing: 1.5,
                              wordSpacing: 1,
                            ),
                          ),
                          InputField(
                            icon1: Icon(
                              Icons.email_outlined,
                              color: Constants.secondryColor,
                            ),
                            icon2: null,
                            title: 'Email address',
                          ),
                          InputField(
                            icon1: Icon(Icons.lock_outline,
                                color: Constants.secondryColor),
                            icon2: Icon(Icons.remove_red_eye,
                                color: Constants.secondryColor),
                            title: 'Password',
                          ),
                          Column(
                            children: [
                              const ButtonIn(pagename: 'Login', page: NavigationScreen()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'don\'t have an account ?',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                      wordSpacing: 1,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pushReplacement(
                                              context,
                                              RightTransition(
                                                  page: Register())),
                                      child: Text(
                                        'Sign up !',
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100,
                                          color: Constants.thirdColor,
                                          letterSpacing: 1.5,
                                          wordSpacing: 1,
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    RightTransition(
                      page: const WelcomeScreen(),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Constants.primaryColor,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
