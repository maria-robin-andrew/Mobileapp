import 'package:bloc/bloc.dart';
import 'package:cba/model/issue_model_1.dart';

import 'package:cba/repository/repos.dart';

class DatabaseEvent {}

class FetchItem extends DatabaseEvent {
  final String phoneNo;

  FetchItem({required this.phoneNo});
}

abstract class DatabaseState {
  const DatabaseState();
}

class DatabaseInitialState extends DatabaseState {}

class DatabaseLoadingState extends DatabaseState {}

class DatabaseSuccessState extends DatabaseState {
  final List<IssueModel> items;

  const DatabaseSuccessState(this.items);
}

class DatabaseErrorState extends DatabaseState {
  final String error;

  const DatabaseErrorState(this.error);
}

class DatafireBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final FireyRepository repository;

  DatafireBloc(this.repository) : super(DatabaseInitialState()) {
    on<FetchItem>((event, emit) async {
      try {
        final items = await repository.getItems(event.phoneNo);
        return emit(DatabaseSuccessState(items));
      } catch (error) {
        return emit(DatabaseErrorState(error.toString()));
      }
    });
  }
}
