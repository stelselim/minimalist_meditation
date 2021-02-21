import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:meditate/infrastructure/model/audioplayer_model.dart';

class CategoryModel with EquatableMixin {
  final List<AudioModel> categoryAudioList;
  final String description;
  final String imageUrl;
  final String categoryName;
  final String id;
  CategoryModel({
    @required this.categoryAudioList,
    @required this.imageUrl,
    @required this.description,
    @required this.categoryName,
    @required this.id,
  });

  factory CategoryModel.initialCategory() => CategoryModel(
        categoryAudioList: [],
        imageUrl: "",
        categoryName: "",
        id: "",
        description: "",
      );

  CategoryModel copyWith({
    List<AudioModel> categoryAudioList,
    String description,
    String imageUrl,
    String categoryName,
    String id,
  }) {
    return CategoryModel(
      categoryAudioList: categoryAudioList ?? this.categoryAudioList,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryName: categoryName ?? this.categoryName,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(categoryAudioList: $categoryAudioList, description: $description, imageUrl: $imageUrl, categoryName: $categoryName, id: $id)';
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryAudioList': categoryAudioList?.map((x) => x?.toMap())?.toList(),
      'description': description,
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
      description: map['description'],
      imageUrl: map['imageUrl'],
      categoryName: map['categoryName'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
