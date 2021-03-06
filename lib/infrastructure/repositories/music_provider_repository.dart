import 'package:meditate/domain/music_provider.dart';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:meditate/infrastructure/model/category_model.dart';
import 'package:meditate/infrastructure/providers/meditation_music_providers.dart';

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
  Future<List<CategoryModel>> getAllCategories() async {
    var response = await getAllPlaylists();
    return response;
  }

  @override
  Future<CategoryModel> getCategoryByMood(String mood) async {
    var response = await getMusicsByMood(mood);
    return response;
  }
}
