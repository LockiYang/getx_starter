import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'wa_search_controller.dart';

class WaSearchView extends GetView<WaSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WaSearchView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WaSearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
