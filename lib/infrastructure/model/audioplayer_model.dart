import 'dart:convert';

import 'package:equatable/equatable.dart';

class AudioModel extends Equatable {
  final String id;
  final String name;
  final String sourceUrl;
  final bool isPlaying;
  final String artist;

  AudioModel({
    this.id,
    this.name,
    this.sourceUrl,
    this.isPlaying,
    this.artist,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sourceUrl': sourceUrl,
      'isPlaying': isPlaying,
      'artist': artist,
    };
  }

  factory AudioModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AudioModel(
      id: map['id'],
      name: map['name'],
      sourceUrl: map['sourceUrl'],
      isPlaying: map['isPlaying'],
      artist: map['artist'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioModel.fromJson(String source) =>
      AudioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AudioModel(id: $id, name: $name, sourceUrl: $sourceUrl, isPlaying: $isPlaying)';
  }

  AudioModel copyWith({
    String id,
    String name,
    String sourceUrl,
    bool isPlaying,
    String artist,
  }) {
    return AudioModel(
      id: id ?? this.id,
      name: name ?? this.name,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      isPlaying: isPlaying ?? this.isPlaying,
      artist: artist ?? this.artist,
    );
  }

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => true;
}
