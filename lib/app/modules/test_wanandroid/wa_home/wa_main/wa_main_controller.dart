import 'package:get/get.dart';


import '../../../../common/widgets/paging_controller.dart';
import '../../../../data/models/article.dart';
import '../../../../data/models/project.dart';
import '../../../../data/repositorys/wan_android_api.dart';

class WaMainController extends PagingController<Article> {
  late WanAndroidApi wanAndroidApi;

  final count = 0.obs;
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
  void increment() => count.value++;

  @override
  Future<List<Article>> loadData() async {
    ProjectPage projectPage =
        await wanAndroidApi.getProjects(pageIndex);
    return projectPage.datas.map((e) => Article.fromJson(e)).toList();
  }
}
