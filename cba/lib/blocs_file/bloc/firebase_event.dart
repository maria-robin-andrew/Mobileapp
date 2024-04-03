part of 'firebase_bloc.dart';

abstract class FirebaseEvent {}

class FetchData extends FirebaseEvent {}

class AddData extends FirebaseEvent {
  final Map<String, dynamic> data;
  AddData(this.data);
}

class UpdateData extends FirebaseEvent {
  final String documentId;
  final Map<String, dynamic> data;
  UpdateData(this.documentId, this.data);
}

class DeleteData extends FirebaseEvent {
  final String documentId;
  DeleteData(this.documentId);
}
