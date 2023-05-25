import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

part 'edit_faq_state.dart';

class EditFAQCubit extends Cubit<EditFAQState> {
  EditFAQCubit() : super(EditFAQInitial());

  final EditFAQService _EditFAQService = EditFAQService();

  void post({required EditFAQParram data}) async {
    emit(OnLoadingEditFAQ());

    var res = await _EditFAQService.post(data: data);

    if (res.statusCode == 200) {
      var _data = EditFaqModel.fromJson(res.data);

      debugPrint('Get Auth Status : Success');

      emit(OnSuccessEditFAQ(data: _data));
    } else {
      debugPrint('Get Auth Status: ${res.toString()}');
      emit(OnErrorEditFAQ());
    }
  }
}
