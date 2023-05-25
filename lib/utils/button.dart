import 'package:flutter/material.dart';
import 'package:ptinformatikamediapratama/lib.dart';

Widget BigButton({
  required String text,
  required void Function()? onTap,
  void Function()? onTapDisable,
  bool isLoading = false,
  bool isChange = true,
  bool shadow = false,
  Widget? icon,
  TextStyle? textStyle,
  Color color = primary,
  Color CircularProgressColor = Colors.white,
}) {
  return InkWell(
    onTap: isChange ? onTap : onTapDisable,
    child: Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isChange ? color : greyPrimary,
        boxShadow: [
          shadow == true
              ? BoxShadow(
                  color: color.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: Offset(0, 4), // changes position of shadow
                )
              : BoxShadow(),
        ],
      ),
      child: Center(
        child: isLoading == true
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: CircularProgressColor,
                  strokeWidth: 3,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon,
                    AppDimens.horizontalSpace8,
                  ],
                  Text(
                    text,
                    style: textStyle ??
                        textNormal(
                          color: neutral90,
                        ),
                  ),
                ],
              ),
      ),
    ),
  );
}

Widget BigButtonBorder({
  required String text,
  required void Function()? onTap,
  bool isLoading = false,
  TextStyle? textStyle,
  Color? color,
  Color? colorCircular,
  IconData? icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(
            width: 0.5,
            color: color ?? primary,
          )),
      child: Center(
        child: isLoading == true
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: colorCircular ?? Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: textStyle ??
                        textNormal(
                          color: neutral90,
                        ),
                  ),
                  if (icon != null) ...[
                    AppDimens.horizontalSpace6,
                    Icon(
                      icon,
                      size: 20,
                      color: neutral90,
                    ),
                  ],
                ],
              ),
      ),
    ),
  );
}

Widget BigButtonGradient({
  required String text,
  required void Function()? onTap,
  void Function()? onTapDisable,
  bool isLoading = false,
  bool isChange = true,
  bool shadow = false,
  Widget? icon,
  TextStyle? textStyle,
  Gradient? color = gradientButton,
  Color CircularProgressColor = Colors.white,
}) {
  return InkWell(
    onTap: isChange ? onTap : onTapDisable,
    child: Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: color,
      ),
      child: Center(
        child: isLoading == true
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: CircularProgressColor,
                  strokeWidth: 3,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon,
                    AppDimens.horizontalSpace8,
                  ],
                  Text(
                    text,
                    style: textStyle ??
                        textNormal(
                          color: neutral90,
                        ),
                  ),
                ],
              ),
      ),
    ),
  );
}

Widget MediumButtonBorder({
  required BuildContext context,
  required String text,
  required void Function()? onTap,
  bool isLoading = false,
  TextStyle? textStyle,
  Color? color,
  Color? colorCircular,
  IconData? icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: color ?? primary,
          )),
      child: Center(
        child: isLoading == true
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: colorCircular ?? Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: textStyle ??
                        textNormal(
                          color: neutral90,
                        ),
                  ),
                  if (icon != null) ...[
                    AppDimens.horizontalSpace6,
                    Icon(
                      icon,
                      size: 20,
                      color: neutral90,
                    ),
                  ],
                ],
              ),
      ),
    ),
  );
}

Widget SmallButtonBorder({
  required BuildContext context,
  required String text,
  required void Function()? onTap,
  bool isLoading = false,
  TextStyle? textStyle,
  Color? color,
  Color? colorCircular,
  IconData? icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: color ?? primary,
          )),
      child: Center(
        child: isLoading == true
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: colorCircular ?? Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: textStyle ??
                        textNormal(
                          color: neutral90,
                        ),
                  ),
                  if (icon != null) ...[
                    AppDimens.horizontalSpace6,
                    Icon(
                      icon,
                      size: 20,
                      color: neutral90,
                    ),
                  ],
                ],
              ),
      ),
    ),
  );
}

Widget confirmDeleteButton(
  BuildContext context, {
  required void Function() onTapConfirm,
  required void Function() onTapDelete,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: onTapConfirm,
        child: Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            color: bluePrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              "Confirm",
              style: textSmall(color: neutral30),
            ),
          ),
        ),
      ),
      AppDimens.horizontalSpace6,
      InkWell(
        onTap: onTapDelete,
        child: Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            color: neutral70,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              "Delete",
              style: textSmall(color: neutral30),
            ),
          ),
        ),
      ),
    ],
  );
}
