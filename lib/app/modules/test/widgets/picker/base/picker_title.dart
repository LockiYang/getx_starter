import 'package:flutter/material.dart';

import 'picker_constants.dart';

/// DatePicker's title widget.

// ignore: must_be_immutable
class PickerTitle extends StatelessWidget {
  // final PickerTitleConfig pickerTitleConfig;
  // final DateTimePickerLocale? locale;
  final String title;
  final Function onCancel, onConfirm;
  // BrnPickerConfig? themeData;

  PickerTitle({
    Key? key,
    // this.locale,
    required this.onCancel,
    required this.onConfirm,
    required this.title,
    // this.pickerTitleConfig = PickerTitleConfig.Default,
    // this.themeData,
  }) : super(key: key) {
    // this.themeData ??= BrnPickerConfig();
    // this.themeData = BrnThemeConfigurator.instance
    //     .getConfig(configId: this.themeData!.configId)
    //     .pickerConfig
    //     .merge(this.themeData);
  }

  @override
  Widget build(BuildContext context) {
    // if (pickerTitleConfig.title != null) {
    //   return pickerTitleConfig.title!;
    // }
    return Container(
      height: pickerTitleHeight,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: pickerTitleHeight - 0.5,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: _renderCancelWidget(context),
                  onTap: () {
                    onCancel();
                  },
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  child: _renderConfirmWidget(context),
                  onTap: () {
                    onConfirm();
                  },
                ),
              ],
            ),
          ),
          Divider(
            color: dividerColor,
            indent: 0.0,
            height: 0.5,
          ),
        ],
      ),
    );
  }

  /// render cancel button widget
  Widget _renderCancelWidget(BuildContext context) {
    Widget? cancelWidget;
    TextStyle textStyle = TextStyle(color: Colors.grey);
    cancelWidget = Text(
      '取消',
      style: textStyle,
      textAlign: TextAlign.left,
    );
    return cancelWidget;
  }

  /// render confirm button widget
  Widget _renderConfirmWidget(BuildContext context) {
    Widget? confirmWidget;
    TextStyle textStyle = TextStyle(color: Colors.blue);
    confirmWidget = Text(
      '完成',
      style: textStyle,
      textAlign: TextAlign.right,
    );
    return confirmWidget;
  }
}
