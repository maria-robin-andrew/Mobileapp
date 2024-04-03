import 'package:cba/model/issue_model_1.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRepository {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  FirebaseRepository(FirebaseDatabase instance);

  Stream<List<IssueModel>> getItems(String phoneNo) {
    final reference = database.reference().child('issue').child(phoneNo);
    print(reference.toString() + "  hello " + reference.onValue.toString());
    return reference.onValue
        .map((event) => _convertSnapshotToList(event.snapshot));
  }

  List<IssueModel> _convertSnapshotToList(DataSnapshot snapshot) {
    final data = snapshot.value as Map<dynamic, dynamic>;
    print(data.toString());
    return data.values.map((item) => IssueModel.fromMap(item)).toList();
  }
}
