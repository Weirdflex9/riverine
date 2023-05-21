import 'package:riverine/generated/json/base/json_convert_content.dart';
import 'package:riverine/entity/article_list_entity.dart';

ArticleListEntity $ArticleListEntityFromJson(Map<String, dynamic> json) {
	final ArticleListEntity articleListEntity = ArticleListEntity();
	final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
	if (pageCount != null) {
		articleListEntity.pageCount = pageCount;
	}
	final List<ArticleEntity>? datas = jsonConvert.convertListNotNull<ArticleEntity>(json['datas']);
	if (datas != null) {
		articleListEntity.datas = datas;
	}
	return articleListEntity;
}

Map<String, dynamic> $ArticleListEntityToJson(ArticleListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['pageCount'] = entity.pageCount;
	data['datas'] =  entity.datas?.map((v) => v.toJson()).toList();
	return data;
}

ArticleEntity $ArticleEntityFromJson(Map<String, dynamic> json) {
	final ArticleEntity articleEntity = ArticleEntity();
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		articleEntity.chapterName = chapterName;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		articleEntity.title = title;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		articleEntity.link = link;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		articleEntity.author = author;
	}
	return articleEntity;
}

Map<String, dynamic> $ArticleEntityToJson(ArticleEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['chapterName'] = entity.chapterName;
	data['title'] = entity.title;
	data['link'] = entity.link;
	data['author'] = entity.author;
	return data;
}