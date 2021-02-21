import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Categories",
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.alegreya().fontFamily,
        ),
      ),
    );
  }
}
