import 'package:bloc_counter/featurs/get_list_bloc/get_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetListBloc>().add(GetList());
    return
    
      Scaffold(
        appBar: AppBar(
          title: const Text('Data List'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                onChanged: (query) {
                  context.read<GetListBloc>().add(SearchList(query));
                },
              ),
            ),
          ),
        ),
        body: BlocBuilder<GetListBloc, GetListState>(
          
          builder: (context, state) {
            print('BlocBuilder triggered with state: $state');
            if (state is SuccessList) {
                   print('---------------mainlist print---------------');
              final items = state.data;

              if (items.isEmpty) {
                return const Center(
                  child: Text('No items match your search query.'),
                );
              }

              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(item.id.toString()),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.body),
                  );
                },
              );
            }else if (state is FilterdListState) {
              print('---------------filter print---------------');
              final items = state.filtereddata;

              if (items.isEmpty) {
                return const Center(
                  child: Text('No items match your search query.'),
                );
              }

              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(item.id.toString()),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.body),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
    //   ),
    // );
  }
}
