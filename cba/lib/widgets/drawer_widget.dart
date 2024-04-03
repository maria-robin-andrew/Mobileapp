import 'package:cba/screens/complaint_dashboard.dart';
import 'package:cba/screens/complaint_status.dart';
import 'package:cba/screens/register_page.dart';
import 'package:cba/utils/shared_preference_functions.dart';
import 'package:flutter/material.dart';

Future<Widget> drawerWidget(BuildContext context, Future<String> p) async {
  String? phoneNumber = await p;
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 28, 141, 255),
    child: SafeArea(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(100)),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 45,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 15),
            child: Center(
              child: Text(
                phoneNumber,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComplaintStatus()));
            },
            leading: const Icon(
              Icons.file_copy_outlined,
              color: Colors.green,
            ),
            title: const Text(
              "Complaint Status",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            // tileColor: Colors.white,
            leading: const Icon(
              Icons.email_outlined,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ComplaintDashboard(
                          phoneNo: "0000",
                        )),
              );
            },
            title: const Text(
              "Inbox",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            onTap: () {
              clearData();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
            },
            leading: const Icon(
              Icons.logout,
              color: Colors.yellow,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
