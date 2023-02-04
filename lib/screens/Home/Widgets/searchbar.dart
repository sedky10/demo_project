
import 'package:flutter/material.dart';

import '../../../contatnts.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        cursorColor: Constants.secondryColor,
        style: TextStyle(
          color: Constants.primaryColor,
          fontFamily: 'Ubuntu',
          letterSpacing: 1.2,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Search item',
          suffixIcon: const Icon(Icons.search),
          suffixIconColor: Constants.secondryColor,
        ),
      ),
    );
  }
}
