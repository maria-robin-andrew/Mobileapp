import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, String> data = {};

void goToComplaint(context, id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  data = jsonDecode(pref.getString('id') ?? "{}");
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ComplaintView()),
  );
}

class ComplaintView extends StatelessWidget {
  const ComplaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${data['complaintId']}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name  :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Text(
                      data['name'] ?? " ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 20),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         "Address  :  ",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 18,
              //             color: Colors.black),
              //       ),
              //       SizedBox(
              //         width: MediaQuery.of(context).size.width * 0.7,
              //         child: const Text(
              //           "Avadi Main Road, Karaiyanchavadi, Poonamallee, Chennai",
              //           style: TextStyle(
              //               fontWeight: FontWeight.w600, fontSize: 16),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Complaint ID  :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Text(
                      data["phone number"] ?? " ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Complaint  :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(
                        data["queries"] ?? " ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Image Uploaded  :  ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              Center(
                  child: Image.asset(
                data["imageUrl"] ?? "assets/images/flood.jpg",
                fit: BoxFit.cover,
                height: 160,
                width: MediaQuery.of(context).size.width * 0.7,
              )),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Department  :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Text(
                      "Flood",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Status  :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Text(
                        "Pending",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.amber),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
