import 'package:flutter/cupertino.dart';

void getMaxPage({
  required int totalRow,
  required int rowPage,
  required ValueSetter<int> setValue,
}) async {
  int maxPage = 1;
  maxPage = double.parse("${totalRow / rowPage}").ceil();
  setValue(maxPage);
}
