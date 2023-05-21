import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverine/res/export.dart';

import 'article_detail_logic.dart';

class ArticleDetailPage extends StatelessWidget {
  ArticleDetailPage({Key? key}) : super(key: key);

  final logic = Get.find<ArticleDetailLogic>();
  final state = Get.find<ArticleDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: 'article',
      ),
    );
  }
}
