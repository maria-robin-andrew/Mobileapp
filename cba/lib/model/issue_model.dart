import 'package:firebase_database/firebase_database.dart';

class IssueList {
  String phoneNo;
  IssueList({required this.phoneNo});
  var comp;
  void init() async {
    final dataref = FirebaseDatabase.instance
        .refFromURL('https://access-car-boot-default-rtdb.firebaseio.com/');
    var data = await dataref.child('/userData/$phoneNo').get();
    if (data.exists) {
      comp = data.value;
    }
  }
}

class Issue {
  late String name;
  late String phoneNumber;
  String? email;
  late String lat;
  late String long;
  String? dept;
  late String status;
  late String imageUrl;
  late String date;
  late String complaintId;
}
