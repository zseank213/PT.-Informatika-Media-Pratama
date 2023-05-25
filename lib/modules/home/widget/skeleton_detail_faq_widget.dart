import 'package:flutter/material.dart';
import 'package:ptinformatikamediapratama/lib.dart';

Widget skeletonDetailFAQWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.5,
          child: const ShimmerEffect(),
        ),
        AppDimens.verticalSpace40,
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 30,
              width: double.infinity,
              child: ShimmerEffect(),
            );
          },
          separatorBuilder: (context, index) => AppDimens.verticalSpace20,
          itemCount: 10,
        ),
      ],
    ),
  );
}
