import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

part 'detail_faq_state.dart';

class DetailFAQCubit extends Cubit<DetailFAQState> {
  DetailFAQCubit() : super(DetailFAQInitial());

  final DetailFAQService _DetailFAQService = DetailFAQService();

  void get({required DetailFAQParram data}) async {
    emit(OnLoadingDetailFAQ());

    var res = await _DetailFAQService.get(data: data);

    if (res.statusCode == 200) {
      var _data = DetailFaqModel.fromJson(res.data);

      debugPrint('Get Auth Status : Success');

      emit(OnSuccessDetailFAQ(data: _data));
    } else {
      debugPrint('Get Auth Status: ${res.toString()}');
      emit(OnErrorDetailFAQ());
    }
  }
}
