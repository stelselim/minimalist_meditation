import 'dart:convert';

import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:http/http.dart' as http;
import 'package:meditate/infrastructure/model/category_model.dart';

Future<AudioModel> getMusicById(String id) async {
  var response = await http.post(id);
  return AudioModel.fromJson(response.body);
}

Future<CategoryModel> getMusicsByCategory(String categoryId) async {
  var response = await http.post(categoryId);
  CategoryModel category = jsonDecode(response.body);
  return category;
}
