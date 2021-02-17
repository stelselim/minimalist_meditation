import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:meditate/infrastructure/model/category_model.dart';
import 'package:meditate/infrastructure/providers/meditation_music_providers.dart';

abstract class MusicProviderRepositoryModel {
  Future<AudioModel> getById(String id);

  Future<CategoryModel> getCategory(String categoryId);

  Future<List<AudioModel>> updateById(String id);

  Future<List<AudioModel>> updateByCategory(String categoryId);
}

class MusicProviderRepository with MusicProviderRepositoryModel {
  @override
  Future<AudioModel> getById(String id) async {
    var response = await getMusicById(id);
    return response;
  }

  @override
  Future<CategoryModel> getCategory(String categoryId) async {
    var response = await getMusicsByCategory(categoryId);
    return response;
  }

  @override
  Future<List<AudioModel>> updateByCategory(String categoryId) async {
    return null;
  }

  @override
  Future<List<AudioModel>> updateById(String id) async {
    return null;
  }
}
