import 'package:riverine/entity/article_list_entity.dart';
import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic());
    final state = Get.find<HomeLogic>().state;

    return Scaffold(
      appBar: TitleBar(
        title: 'Home'.tr,
      ),
      body: GetBuilder<HomeLogic>(builder: (_) {
        return CustomEasyRefresh(
          controller: state.refreshController,
          onLoad: logic.onLoad,
          onRefresh: logic.onRefresh,
          emptyWidget: state.items == null
              ? LottieIndicator()
              : state.items!.isEmpty
                  ? EmptyLayout(hintText: 'No content'.tr)
                  : null,
          child: ListView.separated(
            itemBuilder: (context, index) {
              ArticleEntity _entity = state.items![index];
              return InkWell(
                onTap: () => logic.toArticleDetail(index),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _entity.title ?? '',
                              style: TextStyle(
                                color: Colours.text_333,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20.w),
                            Text(
                              '作者：${_entity.author ?? '匿名'}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      LoadAssetImage(
                        'common/arrow_right',
                        width: 25.w,
                        color: Colours.text_999,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Container(
              height: 2.w,
              color: Colours.divider,
              width: double.infinity,
            ),
            itemCount: state.items?.length ?? 0,
          ),
        );
      }),
    );
  }
}
