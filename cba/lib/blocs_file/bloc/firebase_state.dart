part of 'firebase_bloc.dart';

abstract class FirebaseState {}

class FirebaseInitial extends FirebaseState {}

class FirebaseLoading extends FirebaseState {}

class FirebaseLoaded extends FirebaseState {
  final dynamic data;
  FirebaseLoaded(this.data);
}

class FirebaseAdded extends FirebaseState {}

class FirebaseUpdated extends FirebaseState {}

class FirebaseDeleted extends FirebaseState {}

class FirebaseError extends FirebaseState {
  final String error;
  FirebaseError(this.error);
}
