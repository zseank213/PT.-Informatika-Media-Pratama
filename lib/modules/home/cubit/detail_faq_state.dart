part of 'detail_faq_cubit.dart';

abstract class DetailFAQState {}

class DetailFAQInitial extends DetailFAQState {}

class OnLoadingDetailFAQ extends DetailFAQState {}

class OnErrorDetailFAQ extends DetailFAQState {
  OnErrorDetailFAQ();
}

class OnSuccessDetailFAQ extends DetailFAQState {
  final DetailFaqModel? data;

  OnSuccessDetailFAQ({this.data});
}
