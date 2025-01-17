import 'dart:convert';

ImagesJson imagesJsonFromJson(String str) =>
    ImagesJson.fromJson(json.decode(str));

String imagesJsonToJson(ImagesJson data) => json.encode(data.toJson());

class ImagesJson {
  final String title;
  final String link;
  final Media media;
  final DateTime dateTaken;
  final String description;
  final DateTime published;
  final String author;
  final String authorId;
  final String tags;

  ImagesJson({
    required this.title,
    required this.link,
    required this.media,
    required this.dateTaken,
    required this.description,
    required this.published,
    required this.author,
    required this.authorId,
    required this.tags,
  });

  ImagesJson copyWith({
    String? title,
    String? link,
    Media? media,
    DateTime? dateTaken,
    String? description,
    DateTime? published,
    String? author,
    String? authorId,
    String? tags,
  }) =>
      ImagesJson(
        title: title ?? this.title,
        link: link ?? this.link,
        media: media ?? this.media,
        dateTaken: dateTaken ?? this.dateTaken,
        description: description ?? this.description,
        published: published ?? this.published,
        author: author ?? this.author,
        authorId: authorId ?? this.authorId,
        tags: tags ?? this.tags,
      );

  factory ImagesJson.fromJson(Map<String, dynamic> json) => ImagesJson(
        title: json["title"],
        link: json["link"],
        media: Media.fromJson(json["media"]),
        dateTaken: DateTime.parse(json["date_taken"]),
        description: json["description"],
        published: DateTime.parse(json["published"]),
        author: json["author"],
        authorId: json["author_id"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "media": media.toJson(),
        "date_taken": dateTaken.toIso8601String(),
        "description": description,
        "published": published.toIso8601String(),
        "author": author,
        "author_id": authorId,
        "tags": tags,
      };
}

class Media {
  final String m;

  Media({
    required this.m,
  });

  Media copyWith({
    String? m,
  }) =>
      Media(
        m: m ?? this.m,
      );

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "m": m,
      };
}
