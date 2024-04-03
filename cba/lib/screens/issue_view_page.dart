import 'package:cba/model/issue_model_1.dart';
import 'package:flutter/material.dart';

class IssueViewPage extends StatelessWidget {
  final IssueModel issueData;

  IssueViewPage({
    super.key,
    required this.issueData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          "Envirowatch",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 19,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 28, 141, 255),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/icon/logo.png",
                          fit: BoxFit.cover,
                          height: 75,
                          width: 75,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Container(
                        height: 90,
                        width: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Complaint",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                issueData.complaintId ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 1,
                                ),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(1),
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        height: 250,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(170, 167, 167, 167),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            issueData.imageUrl ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(25, 15, 15, 15),
                        // height: 500,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(170, 167, 167, 167),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            const Text(
                              "Name of the person:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              issueData.name ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // phone Number
                            const Text(
                              "Phone Number:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              issueData.phoneNumber ?? "",
                              style: const TextStyle(
                                color: Color.fromARGB(219, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // Email
                            const Text(
                              "Email:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              issueData.email ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // Status
                            const Text(
                              "Status",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              issueData.status ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // location
                            const Text(
                              "Loaction",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              "${issueData.lat ?? ""}   ${issueData.long ?? ""}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // Department
                            const Text(
                              "Depatment to be handled:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              issueData.department ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // Issue Description
                            const Text(
                              "Issue Description:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              issueData.query ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
