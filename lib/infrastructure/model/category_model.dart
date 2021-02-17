import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';

class CategoryModel {
  final List<AudioModel> categoryAudioList;
  final String imageUrl;
  final String categoryName;
  final String id;
  CategoryModel({
    @required this.categoryAudioList,
    @required this.imageUrl,
    @required this.categoryName,
    @required this.id,
  });

  factory CategoryModel.initialCategory() => CategoryModel(
        categoryAudioList: [],
        imageUrl: "",
        categoryName: "",
        id: "",
      );

  CategoryModel copyWith({
    List<AudioModel> categoryAudioList,
    String imageUrl,
    String categoryName,
    String id,
  }) {
    return CategoryModel(
      categoryAudioList: categoryAudioList ?? this.categoryAudioList,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryName: categoryName ?? this.categoryName,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(categoryAudioList: $categoryAudioList, imageUrl: $imageUrl, categoryName: $categoryName, id: $id)';
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryAudioList': categoryAudioList?.map((x) => x?.toMap())?.toList(),
      'imageUrl': imageUrl,
      'categoryName': categoryName,
      'id': id,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoryModel(
      categoryAudioList: List<AudioModel>.from(
          map['categoryAudioList']?.map((x) => AudioModel.fromMap(x))),
      imageUrl: map['imageUrl'],
      categoryName: map['categoryName'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}
