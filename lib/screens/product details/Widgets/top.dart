import 'package:demo_project/screens/Navigation/Navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Animation/righttransition.dart';
import '../../../contatnts.dart';
import '../../login & register/welcome.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: MaterialButton(
              padding: const EdgeInsets.all(0),
              minWidth: 20,
              onPressed: () => Navigator.pushReplacement(
                context,
                RightTransition(
                  page: const NavigationScreen(),
                ),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Constants.primaryColor,
                size: 30,
              ),
            ),
          ),
          RichText(
              text: TextSpan(
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                      letterSpacing: 1.2,
                      wordSpacing: 5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black), //apply style to all
                  children: [
                    TextSpan(
                      text: 'Cart ',
                      style: TextStyle(
                          fontSize: 22, color: Constants.primaryColor),
                    ),
                  ])),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.deepOrange,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
