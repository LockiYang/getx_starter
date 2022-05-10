import 'package:flutter/material.dart';
import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/widgets/article_item.dart';

import '../../../../common/widgets/paging_refresher.dart';
import 'wa_main_controller.dart';

class WaMainView extends GetzView<WaMainController> {
  @override
  Widget build(BuildContext context) {
    return PagingRefreshWidget<WaMainController>(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return ArticleItem(
                index: 1,
                item: controller.data[index],
              );
            }));
  }
}
