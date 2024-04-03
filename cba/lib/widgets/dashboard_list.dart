import 'package:cba/model/issue_model_1.dart';
import 'package:cba/screens/issue_view_page.dart';
import 'package:flutter/material.dart';

class DashboardListTile extends StatelessWidget {
  const DashboardListTile({
    super.key,
    required this.issueModel,
  });

  final IssueModel issueModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IssueViewPage(
              issueData: issueModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: 150,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.greenAccent,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                issueModel.imageUrl ?? "",
                fit: BoxFit.cover,
                height: 130,
                width: 170,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: 130,
              width: 170,
              decoration: BoxDecoration(
                color: const Color.fromARGB(245, 248, 246, 246),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    spreadRadius: 0.5,
                    blurRadius: 0.5,
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${issueModel.complaintId ?? " "}..."),
                    // SizedBox(height: 10),
                    // Divider(color: Colors.black),
                    Text(DateTime.now().toString().substring(0, 10)),
                    Text(issueModel.query ?? ""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
