part of 'get_list_bloc.dart';

@immutable
sealed class GetListState {}

final class GetListInitial extends GetListState {}

class SuccessList extends GetListState {
  final List<GetListModel> data;
  // List<GetListModel> filtereddata;
  SuccessList({ required this.data});
}
 class FilterdListState extends GetListState {
  final  List<GetListModel> filtereddata;

  FilterdListState({required this.filtereddata});
 }