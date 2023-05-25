part of 'add_faq_cubit.dart';

abstract class AddFAQState {}

class AddFAQInitial extends AddFAQState {}

class OnLoadingAddFAQ extends AddFAQState {}

class OnErrorAddFAQ extends AddFAQState {
  OnErrorAddFAQ();
}

class OnSuccessAddFAQ extends AddFAQState {
  final AddFaqModel? data;

  OnSuccessAddFAQ({this.data});
}
