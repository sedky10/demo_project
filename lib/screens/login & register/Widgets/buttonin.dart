

import 'package:flutter/material.dart';

import '../../../Animation/righttransition.dart';
import '../../../contatnts.dart';

class ButtonIn extends StatefulWidget {
  const ButtonIn({Key? key, required this.pagename, required this.page})
      : super(key: key);
  final String pagename;
  final page;

  @override
  State<ButtonIn> createState() => _ButtonInState();
}

class _ButtonInState extends State<ButtonIn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            foregroundColor: Constants.primaryColor,
            backgroundColor: Constants.secondryColor),
        onPressed: () => Navigator.pushReplacement(
            context, RightTransition(page: widget.page)),
        child: Text(
          widget.pagename.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'Ubuntu'),
        ),
      ),
    );
  }
}
