import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditate/infrastructure/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.categoryModel,
    @required this.onPressFunction,
  }) : super(key: key);

  final CategoryModel categoryModel;
  final Function onPressFunction;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: GoogleFonts.alegreyaSans().fontFamily,
      fontSize: 25,
    );

    return TextButton(
      onPressed: () => onPressFunction,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(categoryModel.imageUrl),
              fit: BoxFit.cover),
          color: Color.fromRGBO(43, 91, 84, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          categoryModel.categoryName,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}
