import 'package:get/get.dart';
import 'package:riverine/entity/article_list_entity.dart';
import 'package:riverine/res/export.dart';

import 'home_state.dart';

class HomeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final HomeState state = HomeState();

  @override
  void onReady() {
    onRefresh();
  }

  Future<void> _query(int currentPage) async {
    final result = await Http().network<ArticleListEntity>(
      Method.get,
      sprintf(Api.articleList, [state.currentPage]),
      queryParameters: {'page_size': 20},
    );
    Loading.dismiss();
    state.refreshController.finishRefresh();
    if (result.success) {
      if (currentPage == 1) {
        state.items = result.content!.datas!;
      } else {
        state.items!.addAll(result.content!.datas!);
      }
      state.refreshController.finishLoad(noMore: currentPage >= result.content!.pageCount!);
      update();
    } else {
      Toast.show(result.message);
    }
  }

  Future<void> onLoad() async {
    await _query(++state.currentPage);
  }

  Future<void> onRefresh() async {
    await _query(state.currentPage = 1);
  }

  toArticleDetail(int index) {
    Get.toNamed(RouteConfig.articleDetail);
  }
}
