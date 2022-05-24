import 'package:get/get.dart';


import '../../../../common/widgets/paging_controller.dart';
import '../../data/index.dart';
import '../../data/project.dart';
import '../../data/wan_android_api.dart';

class WaMainController extends PagingController<Article> {
  late WanAndroidApi wanAndroidApi;

  @override
  void onInit() {
    super.onInit();
    wanAndroidApi = Get.find<WanAndroidApi>();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  Future<List<Article>> loadData() async {
    ProjectPage projectPage =
        await wanAndroidApi.getProjects(currentPage);
    return projectPage.datas.map((e) => Article.fromJson(e)).toList();
  }
}
