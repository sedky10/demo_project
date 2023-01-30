
import 'dart:io';


import 'package:flutter/material.dart';

import '../../../contatnts.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key, required this.title, required this.icon1, required this.icon2})
      : super(key: key);
  final icon1;
  final icon2;
  final title;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          color: Constants.thirdColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 15,
              spreadRadius: -14,
              offset: Offset(0, 3),
            ),
          ]),
      child: TextFormField(
        cursorColor: Constants.primaryColor,
        obscureText: true,
        onFieldSubmitted: (String val) {
          stdout.write(val);
        },
        onChanged: (String val) {
          stdout.write(val);
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.title,
          contentPadding: const EdgeInsets.only(left: 10),
          prefixIcon: widget.icon1,
          suffixIcon: widget.icon2,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
