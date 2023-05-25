import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptinformatikamediapratama/lib.dart';

Widget TittleAndTextField({
  required String tittle,
  TextEditingController? controller,
  bool? haveTittle,
  int? maxLines,
  String? hintText,
  String? helperText,
  String? initialValue,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatter,
  void Function()? onTap,
  void Function(String)? onChange,
  bool? isDisable,
  bool? isNumber,
  bool? isEmail,
  bool? isPassword,
  bool? isFilled,
  bool? isDescription,
  InputDecoration? decoration,
  TextStyle? textTitleStyle,
  Color? fillColor,
  Color? borderColor,
  Color? enableColorBorder,
  FocusNode? focusNode,
  TextInputAction? textInputAction,
  TextInputType? textInputType,
  TextAlign? textAlign,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (haveTittle ?? true) ...[
        Text(
          tittle,
          style: textTitleStyle ??
              textMedium(
                color: neutral90,
              ),
        ),
        AppDimens.verticalSpace6,
      ],
      TextFormField(
        focusNode: focusNode,
        textInputAction: textInputAction,
        obscureText: isPassword ?? false,
        initialValue: initialValue,
        onTap: onTap,
        maxLines: isDescription == true ? 5 : maxLines ?? 1,
        onChanged: onChange,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [if (isNumber ?? false) FilteringTextInputFormatter.digitsOnly, ...?inputFormatter],
        style: textFieldStyle(),
        controller: controller,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: isNumber == true
            ? TextInputType.number
            : isEmail == true
                ? TextInputType.emailAddress
                : textInputType ?? TextInputType.text,
        readOnly: isDisable ?? false,
        decoration: decoration ??
            textInputDecoration(
              isFilled: isFilled,
              helperText: helperText,
              hintText: hintText,
              fillColor: fillColor,
              colorBorder: borderColor,
              enableColorBorder: enableColorBorder,
            ),
        validator: validator,
      ),
      AppDimens.verticalSpace12,
    ],
  );
}

Widget TittleAndTextFieldSuffix({
  required String tittle,
  required TextEditingController controller,
  String? hintText,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatter,
  void Function()? onTap,
  void Function(String)? onChange,
  Widget? suffixIcon,
  bool? isDisable,
  bool? isNumber,
  bool? isEmail,
  bool isPassword = false,
  bool? isFilled,
  InputDecoration? decoration,
  TextStyle? textTitleStyle,
  Color? borderColor,
  Color? enableColorBorder,
  Color? fillColor,
  TextInputAction? textInputAction,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle,
        style: textTitleStyle ??
            textNormal(
              color: neutral90,
            ),
      ),
      AppDimens.verticalSpace6,
      TextFormField(
        textInputAction: textInputAction,
        onTap: onTap,
        onChanged: onChange,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatter,
        obscureText: isPassword,
        style: textFieldStyle(),
        controller: controller,
        keyboardType: isNumber == true
            ? TextInputType.number
            : isEmail == true
                ? TextInputType.emailAddress
                : TextInputType.name,
        readOnly: isDisable ?? false,
        decoration: decoration ??
            textInputDecoration(
              isFilled: isFilled,
              hintText: hintText,
              fillColor: fillColor,
              colorBorder: borderColor,
              suffixIcon: suffixIcon,
              enableColorBorder: enableColorBorder,
            ),
        validator: validator,
      ),
      AppDimens.verticalSpace12,
    ],
  );
}

Widget TittleAndTextFieldPrefix({
  required String tittle,
  required TextEditingController controller,
  String? hintText,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatter,
  void Function()? onTap,
  void Function(String)? onChange,
  Widget? prefixIcon,
  bool? isDisable,
  bool? isNumber,
  bool? isEmail,
  bool isPassword = false,
  bool? isFilled,
  InputDecoration? decoration,
  TextStyle? textTitleStyle,
  Color? borderColor,
  Color? enableColorBorder,
  Color? fillColor,
  TextInputAction? textInputAction,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle,
        style: textTitleStyle ??
            textMedium(
              color: neutral90,
            ),
      ),
      AppDimens.verticalSpace6,
      TextFormField(
        textInputAction: textInputAction,
        onTap: onTap,
        onChanged: onChange,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatter,
        obscureText: isPassword,
        style: textFieldStyle(),
        controller: controller,
        keyboardType: isNumber == true
            ? TextInputType.number
            : isEmail == true
                ? TextInputType.emailAddress
                : TextInputType.name,
        readOnly: isDisable ?? false,
        decoration: decoration ??
            textInputDecoration(
              isFilled: isFilled,
              hintText: hintText,
              fillColor: fillColor,
              colorBorder: borderColor,
              prefixIcon: prefixIcon,
              enableColorBorder: enableColorBorder,
            ),
        validator: validator,
      ),
      AppDimens.verticalSpace12,
    ],
  );
}
