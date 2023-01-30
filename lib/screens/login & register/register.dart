import 'package:demo_project/screens/Navigation/Navigation.dart';
import 'package:demo_project/screens/login%20&%20register/Widgets/buttonin.dart';
import 'package:demo_project/screens/login%20&%20register/Widgets/inputfield.dart';
import 'package:demo_project/screens/login%20&%20register/Widgets/screenheader.dart';
import 'package:demo_project/screens/login%20&%20register/loginscreen.dart';
import 'package:demo_project/screens/login%20&%20register/welcome.dart';
import 'package:flutter/material.dart';

import '../../Animation/righttransition.dart';
import '../../contatnts.dart';
import '../Home/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  const ScreenHeader(image: 'assets/images/header.jpg'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'REGISTER',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: 3,
                            ),
                          ),
                          const Text(
                            'create your account',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              letterSpacing: 1.5,
                              wordSpacing: 1,
                            ),
                          ),
                          InputField(
                              title: 'username',
                              icon1: Icon(Icons.person,
                                  color: Constants.secondryColor),
                              icon2: null),
                          InputField(
                              title: 'Email Adrress',
                              icon1: Icon(Icons.email_outlined,
                                  color: Constants.secondryColor),
                              icon2: null),
                          InputField(
                            title: 'password',
                            icon1: Icon(Icons.lock_outline,
                                color: Constants.secondryColor),
                            icon2: Icon(Icons.remove_red_eye,
                                color: Constants.secondryColor),
                          ),
                          InputField(
                            title: 'confirm password',
                            icon1: Icon(Icons.lock_outline,
                                color: Constants.secondryColor),
                            icon2: Icon(Icons.remove_red_eye,
                                color: Constants.secondryColor),
                          ),
                          const ButtonIn(
                            pagename: 'Register',
                            page: NavigationScreen(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'have an account ?',
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
                                  onPressed: () => Navigator.pushReplacement(
                                      context,
                                      RightTransition(page: const Login())),
                                  child: Text(
                                    'Login!',
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
