import 'package:flutter/material.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';

import '../../../../../common/utils/dialog_util.dart';
import '../../../../../common/widgets/menu_list_tile.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('注销账号'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          MenuListTile(
            title: '注销账号',
            onTap: () => deleteAccountTap(),
          ),
        ]),
      ),
    );
  }

  void deleteAccountTap() {
    DialogUtil.commonDialog(
        title: '确认注销账号：159****6012',
        content: '注销账号后，该账号内所有信息将被清空，且该操作无法恢复，请谨慎操作！',
        nextTap: () => deleteAccount(),
        tipWidget: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Icon(
            Icons.info,
            size: 80,
            color: ZStyleConstans.brandWarning,
          ),
        ));
  }

  void deleteAccount() {
    ToastUtil.show('确认注销');
  }
}
