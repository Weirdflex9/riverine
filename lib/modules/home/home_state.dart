import 'package:riverine/entity/article_list_entity.dart';
import 'package:riverine/res/export.dart';

class HomeState {
  final refreshController = EasyRefreshController();
  late int currentPage;
  List<ArticleEntity>? items;

  HomeState() {
    currentPage = 0;
  }
}
