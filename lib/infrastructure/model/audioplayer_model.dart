import 'dart:convert';

class AudioModel {
  final String id;
  final String name;
  final String sourceUrl;
  final bool isPlaying;

  AudioModel({
    this.id,
    this.name,
    this.sourceUrl,
    this.isPlaying,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sourceUrl': sourceUrl,
      'isPlaying': isPlaying,
    };
  }

  factory AudioModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AudioModel(
      id: map['id'],
      name: map['name'],
      sourceUrl: map['sourceUrl'],
      isPlaying: map['isPlaying'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioModel.fromJson(String source) =>
      AudioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AudioModel(id: $id, name: $name, sourceUrl: $sourceUrl, isPlaying: $isPlaying)';
  }
}
