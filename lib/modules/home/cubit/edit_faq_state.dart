part of 'edit_faq_cubit.dart';

abstract class EditFAQState {}

class EditFAQInitial extends EditFAQState {}

class OnLoadingEditFAQ extends EditFAQState {}

class OnErrorEditFAQ extends EditFAQState {
  OnErrorEditFAQ();
}

class OnSuccessEditFAQ extends EditFAQState {
  final EditFaqModel? data;

  OnSuccessEditFAQ({this.data});
}
