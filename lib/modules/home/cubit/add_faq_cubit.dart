import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

part 'add_faq_state.dart';

class AddFAQCubit extends Cubit<AddFAQState> {
  AddFAQCubit() : super(AddFAQInitial());

  final AddFAQService _AddFAQService = AddFAQService();

  void post({required AddFAQParram data}) async {
    emit(OnLoadingAddFAQ());

    var res = await _AddFAQService.post(data: data);

    if (res.statusCode == 200) {
      var _data = AddFaqModel.fromJson(res.data);

      debugPrint('Get Auth Status : Success');

      emit(OnSuccessAddFAQ(data: _data));
    } else {
      debugPrint('Get Auth Status: ${res.toString()}');
      emit(OnErrorAddFAQ());
    }
  }
}
