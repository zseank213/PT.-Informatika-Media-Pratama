import 'package:ptinformatikamediapratama/lib.dart';
import 'package:flutter/material.dart';

Widget skeletonListFAQWidget() {
  return ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return const SizedBox(
        height: 50,
        width: double.infinity,
        child: ShimmerEffect(),
      );
    },
    separatorBuilder: (context, index) => AppDimens.verticalSpace12,
    itemCount: 5,
  );
}
