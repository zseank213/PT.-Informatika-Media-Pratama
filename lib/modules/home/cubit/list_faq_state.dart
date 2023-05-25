part of 'list_faq_cubit.dart';

abstract class ListFAQState {}

class ListFAQInitial extends ListFAQState {}

class OnLoadingListFAQ extends ListFAQState {}

class OnErrorListFAQ extends ListFAQState {
  OnErrorListFAQ();
}

class OnSuccessListFAQ extends ListFAQState {
  final ListFaqModel? data;

  OnSuccessListFAQ({this.data});
}
