import 'package:flutter/material.dart';
import 'package:msh_checkbox/src/painting/check.dart';

import 'msh_checkbox_base.dart';

class ScaleFillCheckbox extends StatelessWidget {
  final MSHCheckboxBase parent;

  const ScaleFillCheckbox({Key? key, required this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = parent.animation.drive(
      Tween(begin: 0.0, end: parent.size + parent.strokeWidth).chain(
        CurveTween(
          curve: Curves.easeOutCirc,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: animation.value,
              width: animation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: parent.isDisabled
                    ? parent.disabledColor
                    : parent.checkedColor,
              ),
            ),
            Opacity(
              opacity: parent.animation.value,
              child: Check(
                color: Colors.white,
                fillPercentage: 1,
                size: parent.size * 0.4,
                strokeWidth: parent.strokeWidth,
              ),
            ),
          ],
        );
      },
    );
  }
}
