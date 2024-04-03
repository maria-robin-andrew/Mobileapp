import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:firebase_database/firebase_database.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc() : super(FirebaseInitial());

  Stream<FirebaseState> mapEventToState(FirebaseEvent event) async* {
    if (event is FetchData) {
      yield* _mapFetchDataToState(event);
    } else if (event is AddData) {
      yield* _mapAddDataToState(event);
    } else if (event is UpdateData) {
      yield* _mapUpdateDataToState(event);
    } else if (event is DeleteData) {
      yield* _mapDeleteDataToState(event);
    }
  }

  Stream<FirebaseState> _mapFetchDataToState(FetchData event) async* {
    try {
      yield FirebaseLoading();
      final data = await FirebaseDatabase.instance.ref('data').get();
      yield FirebaseLoaded(data.value);
    } catch (e) {
      yield FirebaseError(e.toString());
    }
  }

  Stream<FirebaseState> _mapAddDataToState(AddData event) async* {
    try {
      yield FirebaseLoading();
      await FirebaseDatabase.instance.ref('data').push().set(event.data);
      yield FirebaseAdded();
    } catch (e) {
      yield FirebaseError(e.toString());
    }
  }

  Stream<FirebaseState> _mapUpdateDataToState(UpdateData event) async* {
    try {
      yield FirebaseLoading();
      await FirebaseDatabase.instance
          .ref('data/${event.documentId}')
          .set(event.data);
      yield FirebaseUpdated();
    } catch (e) {
      yield FirebaseError(e.toString());
    }
  }

  Stream<FirebaseState> _mapDeleteDataToState(DeleteData event) async* {
    try {
      yield FirebaseLoading();
      await FirebaseDatabase.instance.ref('data/${event.documentId}').remove();
      yield FirebaseDeleted();
    } catch (e) {
      yield FirebaseError(e.toString());
    }
  }
}
