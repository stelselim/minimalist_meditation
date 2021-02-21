import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditate/constant/styles/color.dart' as appcolor;
import 'package:meditate/infrastructure/model/category_model.dart';
import 'package:meditate/presentation/utility/go_playlist.dart';

class BigMeditationCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const BigMeditationCard({
    Key key,
    @required this.categoryModel,
  }) : super(key: key);

  static const backgroundColor = Color.fromRGBO(247, 243, 240, 1);

  static final titleTextStyle = TextStyle(
    fontFamily: GoogleFonts.alegreya().fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(37, 51, 52, 1),
  );
  static final subtitleTextStyle = TextStyle(
    fontFamily: GoogleFonts.alegreyaSans().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color.fromRGBO(37, 51, 52, 1),
  );

  static final buttonTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: GoogleFonts.aBeeZee().fontFamily,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final String cardImageUrl = categoryModel.imageUrl;
    final String cardTitle = categoryModel.categoryName;
    final String cardDescription = categoryModel.categoryName;

    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                // color: Colors.amber,
                ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      cardTitle,
                      style: titleTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      cardDescription,
                      style: subtitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => appcolor.backgroundColor),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 110,
                          height: 40,
                          child: Text(
                            "Play Now",
                            textAlign: TextAlign.center,
                            style: buttonTextStyle,
                          ),
                        ),
                        onPressed: () {
                          try {
                            goToPlaylistPage(
                              context: context,
                              playlist: categoryModel,
                            );
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              child: CachedNetworkImage(imageUrl: cardImageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
