import 'package:flutter/material.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';

const double _borderWidth = 1.5;

class BasicSwitchButton extends StatelessWidget {
  final Size size;

  /// Whether this switch is on or off.
  ///
  /// This property must not be null.
  final bool value;

  /// can click
  final bool enabled;

  final ValueChanged<bool>? onChanged;

  final Color? borderColor;

  final Color? trackColor;

  final Color thumbColor;

  BasicSwitchButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.size,
    this.thumbColor = Colors.white,
    this.trackColor,
    this.borderColor,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enabled) {
          onChanged?.call(!value);
        }
      },
      child: Stack(
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: trackColor ?? _getTrackColor(),
              border: Border.all(
                  color: value
                      ? Colors.transparent
                      : (borderColor ?? _getBorderColor()),
                  width: _borderWidth),
              borderRadius: BorderRadius.all(Radius.circular(size.height / 2)),
            ),
          ),
          _getThumb(value)
        ],
      ),
    );
  }

  Positioned _getThumb(bool value) {
    return (value)
        ? Positioned(
            child: Padding(
              padding: EdgeInsets.only(right: _borderWidth),
              child: Container(
                height: size.height - 2 * _borderWidth,
                width: size.height - 2 * _borderWidth,
                decoration: BoxDecoration(
                  color: thumbColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(size.height / 2 - _borderWidth)),
                ),
              ),
            ),
          )
        : Positioned(
            child: Container(
              height: size.height,
              width: size.height,
              decoration: BoxDecoration(
                color: thumbColor,
                border: Border.all(
                    color: (borderColor ?? _getBorderColor()),
                    width: _borderWidth),
                borderRadius:
                    BorderRadius.all(Radius.circular(size.height / 2)),
              ),
            ),
          );
  }

  // 开关色
  Color _getTrackColor() {
    if (value) {
      return enabled
          ? ZStyleConstans.brandPrimary
          : ZStyleConstans.brandPrimary.withAlpha(20);
    } else {
      return enabled ? Color(0xFFFAFAFA) : Color(0xFFeeeeee);
    }
  }

  // 边框色
  Color _getBorderColor() {
    if (value) {
      return _getTrackColor();
    } else {
      if (enabled) {
        return const Color(0xffeeeeee);
      } else {
        return const Color(0xffeeeeee);
      }
    }
  }
}
