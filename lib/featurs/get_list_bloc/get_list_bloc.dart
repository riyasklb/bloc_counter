

import 'package:bloc/bloc.dart';
import 'package:bloc_counter/model/get_list_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'get_list_event.dart';
part 'get_list_state.dart';

class GetListBloc extends Bloc<GetListEvent, GetListState> {
  GetListBloc() : super(GetListInitial()) {
    on<GetListEvent>((event, emit) async {
      var client = http.Client();

      try {
        var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        );
        //  print(response.body);
        final List<GetListModel> data = getListModelFromJson(response.body);
  //      print(data);
        // final data = GetListModel.fromJson(json.decode(response.body));
        emit(SuccessList(data: data));
      } catch (e) {
        print(e);
      }
    });

    on<SearchList>((event, emit) {
      print('============================');
      if (state is SuccessList) {
        print('------------------------------1');
        final currentState = state as SuccessList;
        final filtereddata = currentState.data.where((item) {
          return item.title.toLowerCase().contains(event.query.toLowerCase()) ||
              item.body.toLowerCase().contains(event.query.toLowerCase());
        }).toList();
        print('------------------------------2');
    //    currentState.filtereddata = filtereddata;
        emit(FilterdListState(filtereddata: filtereddata));
         print("Filtered Data: $filtereddata");
          print('------------------------------3');
      }});
  }
}
