import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameText extends StatelessWidget {
  const NameText({Key key, this.nameText}) : super(key: key);

  final String nameText;

  static final nameTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: GoogleFonts.alegreya().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        nameText,
        textScaleFactor: 1.75,
        style: nameTextStyle,
      ),
    );
  }
}
