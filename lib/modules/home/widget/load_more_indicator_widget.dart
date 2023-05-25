import 'package:flutter/material.dart';
import 'package:ptinformatikamediapratama/lib.dart';

Widget loadMoreIndicatorWidget() {
  return Column(
    children: const [
      AppDimens.verticalSpace12,
      CircularProgressIndicator(
        color: primary,
        strokeWidth: 3,
      ),
      AppDimens.verticalSpace12,
    ],
  );
}
