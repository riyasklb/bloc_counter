import 'package:bloc_counter/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              context.read<CounterBloc>().add(Decrement());
            },
            child: Icon(Icons.remove_circle)),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(state.count.toString());
          },
        ),
      ),
      floatingActionButton: InkWell(
          onTap: () {
            context.read<CounterBloc>().add(Increment());
          },
          child: Icon(Icons.add)),
    );
  }
}
