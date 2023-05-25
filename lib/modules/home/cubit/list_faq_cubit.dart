import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

part 'list_faq_state.dart';

class ListFAQCubit extends Cubit<ListFAQState> {
  ListFAQCubit() : super(ListFAQInitial());

  final ListFAQService _ListFAQService = ListFAQService();

  void get({required ListFAQParram data}) async {
    emit(OnLoadingListFAQ());

    var res = await _ListFAQService.get(data: data);

    if (res.statusCode == 200) {
      var _data = ListFaqModel.fromJson(res.data);

      debugPrint('Get Auth Status : Success');

      emit(OnSuccessListFAQ(data: _data));
    } else {
      debugPrint('Get Auth Status: ${res.toString()}');
      emit(OnErrorListFAQ());
    }
  }
}
