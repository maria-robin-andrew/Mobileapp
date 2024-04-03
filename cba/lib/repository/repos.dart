import 'package:cba/model/issue_model_1.dart';
import 'package:cba/utils/edit_data.dart';

class FireyRepository {
  Future<List<IssueModel>> getItems(String phoneNo) async {
    try {
      List<Map<String, String>> snap = await getIssue();
      List<IssueModel> vary = [];
      for (var i in snap) {
        var j = IssueModel.fromMap(i);
        vary = [...vary, j];
      }

      // print(vary.toString());
      return vary;
    } catch (e) {
      print(e.toString() + " jjjjjjjreeeeeee");
    }
    return [];
  }

  // List<IssueModel> _convertSnapshotToList(data) {
  //   // final data = snapshot.value as Map<dynamic, dynamic>;
  //   print(data.toString());
  //   return data.values.map((item) => IssueModel.fromMap(item)).toList();
  // }
}
