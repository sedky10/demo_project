import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Animation/righttransition.dart';
import '../../../contatnts.dart';
import '../../login & register/welcome.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

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
                  page: const WelcomeScreen(),
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
                    const TextSpan(
                      text: 'Find ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                    TextSpan(
                      text: 'Your\nDesire ',
                      style: TextStyle(
                          fontSize: 22, color: Constants.primaryColor),
                    ),
                    TextSpan(
                      text: 'Product.',
                      style: TextStyle(color: Constants.secondryColor),
                    )
                  ])),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: Colors.deepOrange,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
