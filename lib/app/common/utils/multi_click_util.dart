import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MultiClickUtil {
  const MultiClickUtil._();

  static DateTime? _lastClickTime;

  static bool isMultiClick({int intervalMilliseconds = 500}) {
    if (_lastClickTime == null ||
        DateTime.now().difference(_lastClickTime!) >
            Duration(milliseconds: intervalMilliseconds)) {
      _lastClickTime = DateTime.now();
      return false;
    }
    return true;
  }

  static void debounce(GestureTapCallback? onTap) {
    debugPrint('debounce');
    if (isMultiClick()) {
      return;
    } else {
      onTap!();
    }
  }

  test() {
    debounce(() => {});
  }

  // final Map<String, Timer> _funcDebounce = {};

  /// 函数防抖
  ///
  /// [func]: 要执行的方法
  /// [milliseconds]: 要迟延的毫秒时间
// Function debouncea(Function func, [int milliseconds = 2000]) {
//   Function target = () {
//     String key = func.hashCode.toString();
//     Timer? _timer = _funcDebounce[key];
//     if (_timer == null) {
//       func.call();
//       _timer = Timer(Duration(milliseconds: milliseconds), () {
//         Timer? t = _funcDebounce.remove(key);
//         t?.cancel();
//         t = null;
//       });
//       _funcDebounce[key] = _timer;
//     }
//   };
//   return target;
// }

}
