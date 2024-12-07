import 'package:bloc_counter/ui/conunter_page.dart';

import 'package:bloc_counter/featurs/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/featurs/get_list_bloc/get_list_bloc.dart';
import 'package:bloc_counter/ui/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<GetListBloc>(create: (context) => GetListBloc())
      ],
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyWidget(),
      ),
    );
  }
}
