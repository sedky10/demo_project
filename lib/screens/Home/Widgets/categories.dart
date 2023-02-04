import 'package:flutter/material.dart';

import '../../../contatnts.dart';

class CategoriesList extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function()? function;

  const CategoriesList({this.text, this.color, this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.only(left: 15),
        width: 140,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            // border: Border.all(color:borderColor!,width: 2 ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          text!,
          style: TextStyle( 
            color: Constants.primaryColor,
            fontFamily: 'Ubuntu',
            letterSpacing: 1.5,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
