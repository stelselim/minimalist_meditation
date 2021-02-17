import 'dart:convert';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:http/http.dart' as http;
import 'package:meditate/infrastructure/model/category_model.dart';

final category2 = CategoryModel(
  categoryAudioList: [
    AudioModel(
        id: "blank-space",
        isPlaying: false,
        name: "Taylor Swift - Blank Space",
        sourceUrl: "https://www.youtube.com/watch?v=e-ORhEE9VVg")
  ],
  imageUrl:
      "https://hips.hearstapps.com/ell.h-cdn.co/assets/cm/15/02/640x426/54abb224c5bd7_-_elle-taylor-blank-space-lgn.jpg?resize=480:*",
  categoryName: "blank space",
  id: "taylor-swift",
);

Future<CategoryModel> fakeApiCall() async {
  await Future.delayed(Duration(seconds: 1));
  return category2;
}

Future<AudioModel> getMusicById(String id) async {
  var response = await http.post(id);
  return AudioModel.fromJson(response.body);
}

Future<CategoryModel> getMusicsByCategory(String categoryId) async {
  // var response = await http.post(categoryId);
  // CategoryModel category = jsonDecode(response.body);

  var response = await fakeApiCall();
  CategoryModel category = response;
  print(category.categoryAudioList);
  return category;
}

Future<CategoryModel> getMusicsByMood(String categoryId) async {
  var response = await http.post(categoryId);
  CategoryModel category = jsonDecode(response.body);
  return category;
}
