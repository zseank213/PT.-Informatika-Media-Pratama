part of 'delete_faq_cubit.dart';

abstract class DeleteFAQState {}

class DeleteFAQInitial extends DeleteFAQState {}

class OnLoadingDeleteFAQ extends DeleteFAQState {}

class OnErrorDeleteFAQ extends DeleteFAQState {
  OnErrorDeleteFAQ();
}

class OnSuccessDeleteFAQ extends DeleteFAQState {
  final DeleteFaqModel? data;

  OnSuccessDeleteFAQ({this.data});
}
