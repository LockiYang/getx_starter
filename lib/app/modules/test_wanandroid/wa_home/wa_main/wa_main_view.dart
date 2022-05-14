import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_keep_alive.dart';
import 'package:getx_test/app/modules/test_wanandroid/widgets/article_item.dart';
import 'package:getx_test/app/modules/webview/webview_controller.dart';

import '../../../../common/widgets/paging_refresher.dart';
import '../../../../routes/app_pages.dart';
import 'wa_main_controller.dart';

class WaMainView extends GetzViewKeepAlive<WaMainController> {
  @override
  Widget build(BuildContext context) {
    return PagingRefreshWidget<WaMainController>(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true, // 无边界滚动
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.WEBVIEW,
                    arguments: WebModel(
                        title: controller.data[index].title,
                        link: controller.data[index].link,
                        id: controller.data[index].id,
                        isCollect: controller.data[index].collect)),
                child: ArticleItem(
                  index: 1,
                  item: controller.data[index],
                ),
              );
            }));
  }
  
  @override
  Bindings? binding() {
    return null;
  }
}
