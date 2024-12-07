part of 'get_list_bloc.dart';

@immutable
sealed class GetListEvent {}



class GetList extends GetListEvent{}

class SearchList extends GetListEvent {
  final String query;

  SearchList(this.query);
}