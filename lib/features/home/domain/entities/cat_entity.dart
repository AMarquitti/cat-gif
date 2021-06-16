import 'dart:convert';

class CatEntity {
  CatEntity({
    required this.id,
    required this.url,
  });

  factory CatEntity.fromJson(String str) => CatEntity.fromMap(json.decode(str));

  factory CatEntity.fromMap(Map<String, dynamic> json) => CatEntity(
        id: json['id'],
        url: json['url'],
      );

  String id;
  String url;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'url': url,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CatEntity && other.id == id && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}
