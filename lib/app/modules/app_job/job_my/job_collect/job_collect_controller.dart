import 'package:getx_test/app/common/widgets/paging_controller.dart';
import 'package:getx_test/app/modules/app_job/data/models/pagination.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';

import '../../data/models/post.dart';

class JobCollectController extends PagingController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  Future<List<Post>> loadData() async {
    Pagination<Post> result = await JobApi.to.getCollectPage(currentPage);
    if (result.pageNum < result.pages) {
      hasMore = true;
    } else {
      hasMore = false;
    }
    return result.data;
  }
}
