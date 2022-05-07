import 'package:get/get.dart';
import 'package:getx_test/app/common/widgets/paging_controller.dart';
import '../../../data/models/project.dart';
import '../../../data/repositorys/wan_android_api.dart';

class WaProjectController extends PagingController<Project> {
  late WanAndroidApi wanAndroidApi;

  @override
  loadData() async {
    await wanAndroidApi.getProjects(pageIndex, success: (data, total) {
      hasMore = data.length < total;
      newData = data;
    }, fail: (code, msg) {
      loadStatus = 3;
      // 重试 refreshData
    });
  }

  @override
  void onInit() {
    super.onInit();
    wanAndroidApi = Get.find<WanAndroidApi>();
  }

}
