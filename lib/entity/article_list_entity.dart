import 'package:riverine/generated/json/base/json_field.dart';
import 'package:riverine/generated/json/article_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ArticleListEntity {

  int? pageCount;
  List<ArticleEntity>? datas;

  ArticleListEntity();

  factory ArticleListEntity.fromJson(Map<String, dynamic> json) => $ArticleListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleEntity {

  String? chapterName;
  String? title;
  String? link;
  String? author;

  ArticleEntity();

  factory ArticleEntity.fromJson(Map<String, dynamic> json) => $ArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}