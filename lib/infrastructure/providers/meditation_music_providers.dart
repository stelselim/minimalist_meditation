import 'dart:convert';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:http/http.dart' as http;
import 'package:meditate/infrastructure/model/category_model.dart';

import '../dummy_data.dart';

//////// DUMMY FUNCTIONS

Future<List<CategoryModel>> fakeApiGetAllCategories() async {
  await Future.delayed(Duration(seconds: 1));
  return categoriesList;
}

Future<CategoryModel> fakeApiCall() async {
  await Future.delayed(Duration(seconds: 1));
  return category2;
}

Future<AudioModel> fakeApiCallForAudio() async {
  await Future.delayed(Duration(seconds: 1));
  return audioModel;
}

//////// REAL

Future<AudioModel> getMusicById(String id) async {
  // var response = await http.post(id);
  // return AudioModel.fromJson(response.body);

  var response = await fakeApiCallForAudio();
  return response;
}

Future<CategoryModel> getMusicsByCategory(String categoryId) async {
  // var response = await http.post(categoryId);
  // CategoryModel category = jsonDecode(response.body);

  var response = await fakeApiCall();
  CategoryModel category = response;
  return category;
}

Future<List<CategoryModel>> getAllPlaylists() async {
  // var response = await http.post(categoryId);
  // CategoryModel category = jsonDecode(response.body);

  var response = await fakeApiGetAllCategories();
  return response;
}

Future<CategoryModel> getMusicsByMood(String categoryId) async {
  var response = await http.post(categoryId);
  CategoryModel category = jsonDecode(response.body);
  return category;
}
