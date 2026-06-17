
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        hintText: "Search",
        suffixIcon: Padding(
          padding: EdgeInsetsGeometry.only(right: 12),
          child: IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
        ),
      ),
    );
  }
}