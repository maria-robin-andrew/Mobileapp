import 'package:cba/blocs_file/fire_bloc.dart';
import 'package:cba/repository/firebase_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DatabaseBloc(FirebaseRepository(FirebaseDatabase.instance)),
      child: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          if (state is DatabaseInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DatabaseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DatabaseSuccessState) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                );
              },
            );
          } else if (state is DatabaseErrorState) {
            return Center(child: Text(state.error));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
