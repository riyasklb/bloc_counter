import 'package:bloc/bloc.dart';
import 'package:bloc_counter/featurs/counter_bloc/counter_state.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>((event, emit) {
      return emit(CounterState(count: state.count + 1));
    });

    on<Decrement>((event, emit) {
      if (state.count > 0) {
        emit(CounterState(count: state.count - 1));
      }
    });
  }
}
