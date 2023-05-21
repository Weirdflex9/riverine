import 'package:get/get.dart';

import 'article_detail_logic.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailLogic());
  }
}
