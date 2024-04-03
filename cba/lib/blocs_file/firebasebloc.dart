import 'package:firebase_database/firebase_database.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc() : super(FirebaseInitial());

  @override
  Stream<FirebaseState> mapEventToState(FirebaseEvent event) async* {
    if (event is FetchData) {
      yield FirebaseFetching();
      try {
        final dataref = await FirebaseDatabase.instance.reference();
        final data = dataref.child('/userData/$event.phoneNo').get();
        final dataList = data.value;
        yield FirebaseDataLoaded(dataList);
      } catch (error) {
        yield FirebaseFetchingFailed(error.toString());
      }
    }
  }
}

abstract class FirebaseEvent extends Equatable {
  FirebaseEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends FirebaseEvent {}

abstract class FirebaseState extends Equatable {
  FirebaseState();

  @override
  List<Object> get props => [];
}

class FirebaseInitial extends FirebaseState {}

class FirebaseFetching extends FirebaseState {}

class FirebaseDataLoaded extends FirebaseState {
  final List<dynamic> data;
  FirebaseDataLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class FirebaseFetchingFailed extends FirebaseState {
  final String error;
  FirebaseFetchingFailed(this.error);

  @override
  List<Object> get props => [error];
}
