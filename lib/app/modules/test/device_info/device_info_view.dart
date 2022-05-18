import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:getx_test/app/common/getx/getz_view.dart';

import 'device_info_controller.dart';

class DeviceInfoView extends GetzView<DeviceInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kIsWeb
              ? 'Web Browser info'
              : Platform.isAndroid
                  ? 'Android Device Info'
                  : Platform.isIOS
                      ? 'iOS Device Info'
                      : Platform.isLinux
                          ? 'Linux Device Info'
                          : Platform.isMacOS
                              ? 'MacOS Device Info'
                              : Platform.isWindows
                                  ? 'Windows Device Info'
                                  : '',
        ),
      ),
      body: ListView(
        children: controller.deviceData.keys.map(
          (String property) {
            return Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    property,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    '${controller.deviceData[property]}',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
