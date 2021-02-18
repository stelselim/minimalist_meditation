import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:meditate/infrastructure/model/category_model.dart';

abstract class MusicProviderRepositoryModel {
  Future<AudioModel> getById(String id);

  Future<CategoryModel> getCategory(String categoryId);

  Future<CategoryModel> getCategoryByMood(String mood);
}
