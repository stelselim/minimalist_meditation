import 'dart:convert';

import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:http/http.dart' as http;

Future<AudioModel> getMusicById(String id) async {
  var response = await http.post(id);
  return AudioModel.fromJson(response.body);
}

Future<List<AudioModel>> getMusicsByCategory(String categoryId) async {
  var response = await http.post(categoryId);
  List<AudioModel> audioList = jsonDecode(response.body);
  return audioList;
}
