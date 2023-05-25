import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

part 'delete_faq_state.dart';

class DeleteFAQCubit extends Cubit<DeleteFAQState> {
  DeleteFAQCubit() : super(DeleteFAQInitial());

  final DeleteFAQService _DeleteFAQService = DeleteFAQService();

  void delete({required DeleteFAQParram data}) async {
    emit(OnLoadingDeleteFAQ());

    var res = await _DeleteFAQService.delete(data: data);

    if (res.statusCode == 200) {
      var _data = DeleteFaqModel.fromJson(res.data);

      debugPrint('Get Auth Status : Success');

      emit(OnSuccessDeleteFAQ(data: _data));
    } else {
      debugPrint('Get Auth Status: ${res.toString()}');
      emit(OnErrorDeleteFAQ());
    }
  }
}
