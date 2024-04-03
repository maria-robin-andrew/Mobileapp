// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'package:cba/blocs_file/fire.dart';
import 'package:cba/screens/complaint_dashboard.dart';
import 'package:cba/screens/complaint_status.dart';
import 'package:cba/screens/register_page.dart';
import 'package:cba/screens/success_page.dart';
import 'package:cba/utils/edit_data.dart';
import 'package:cba/utils/shared_preference_functions.dart';
import 'package:cba/widgets/snackbar_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final dataref = FirebaseDatabase.instance.reference();
  String imageUrl = '';
  String lat = "";
  String long = "";
  // final Future<String?> _phone = loadData('phoneNo');
  // final Future<String?> _name = loadData('name');
  // final Future<String?> _email = loadData('email');

  String? _phone;
  String? _name;
  String? _email;

  String complaintId = "";
  bool tap = false;
  bool uploaded = false;
  bool uploading = false;
  TextEditingController additionalInfoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String? p = await loadData('phoneNo');
    String? n = await loadData('name');
    String? e = await loadData('email');

    _phone = p;
    _name = n;
    _email = e;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {});
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Envirowatch Complaint",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 19,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 128, 254),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComplaintStatus()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
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
                    _phone ?? " ",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                onTap: () {
                  runnun();
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
                        builder: (context) => ComplaintDashboard(
                              phoneNo: _phone ?? " ",
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Center(
                child: Text(
                  "Upload the Image",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              uploading == true && uploaded == false
                  ? const Padding(
                      padding: EdgeInsets.all(40),
                      child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator()),
                    )
                  : uploading == true && uploaded == true
                      ? const Icon(
                          Icons.photo_size_select_actual_outlined,
                          size: 120,
                          color: Colors.grey,
                        )
                      : Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.shade300,
                          ),
                          child: IconButton(
                              onPressed: () async {
                                var status =
                                    await Permission.location.request();
                                if (status.isGranted) {
                                  Position position =
                                      await Geolocator.getCurrentPosition(
                                    desiredAccuracy: LocationAccuracy.high,
                                  );
                                  setState(() {
                                    lat = position.latitude.toString();
                                    long = position.longitude.toString();
                                  });

                                  ImagePicker imagePicker = ImagePicker();
                                  XFile? file = await imagePicker.pickImage(
                                      source: ImageSource.camera);
                                  // print('${file?.path}');
                                  setState(() {
                                    uploading = true;
                                  });

                                  if (file == null) {
                                    return;
                                  }
                                  String uniqueFileName = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();

                                  complaintId =
                                      (uniqueFileName + (_phone ?? " "));

                                  Reference referenceRoot =
                                      FirebaseStorage.instance.ref();
                                  Reference referenceDirImages =
                                      referenceRoot.child('images');

                                  Reference referenceImageToUpload =
                                      referenceDirImages.child(uniqueFileName);

                                  try {
                                    await referenceImageToUpload.putFile(
                                        File(file.path),
                                        SettableMetadata(
                                          contentType: "image/jpeg",
                                        ));
                                    imageUrl = await referenceImageToUpload
                                        .getDownloadURL();
                                    setState(() {
                                      uploaded = true;
                                    });
                                  } catch (error) {
                                    if (kDebugMode) {
                                      print(error.toString());
                                    }
                                  }
                                } else {
                                  if (kDebugMode) {
                                    print("no");
                                  }
                                }
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 50,
                              )),
                        ),
              uploading == true && uploaded == false
                  ? const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Uploading Image.....",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                            fontSize: 13),
                      ),
                    )
                  : uploaded == true && uploading == true
                      ? const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Uploded Successfully!!",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 13),
                          ),
                        )
                      : Container(),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  toggle();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.add,
                      size: 23,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Describe your Problem",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              tap == true
                  ? TextField(
                      keyboardType: TextInputType.multiline,
                      controller: additionalInfoController,
                      maxLines: 10,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                      decoration: InputDecoration(
                        //  fillColor: "#FAFAFA".toColor(),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        hintText: "Enter Additional Info",
                        hintStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Center(
              child: SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                    onPressed: () async {
                      insert(imageUrl);
                      showSnackBar(context, "Issue sent!!!!");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SuccessPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: const Color(0xff358FEA)),
                    child: const Text(
                      "Post",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                          color: Colors.white),
                    )),
              ),
            )),
      ),
    );
  }

  void insert(String imageUrl) {
    String date = DateTime.now().toString();
    dataref.child("data").set({
      "imageUrl": imageUrl,
      "latitude": lat.toString(),
      "longitude": long.toString(),
      "queries": additionalInfoController.text,
      "name": _name,
      "phone number": _phone,
      "email": _email,
      "complaintID": complaintId,
      "date": date,
    });
    var data = {
      "imageUrl": imageUrl,
      "latitude": lat.toString(),
      "longitude": long.toString(),
      "queries": additionalInfoController.text,
      "name": _name ?? "",
      "phone number": _phone ?? "",
      "email": _email ?? "",
      "complaintID": complaintId,
      "status": "issue sent",
      "date": date,
      "department": "",
    };
    dataref.child("issue").child(_phone!).child(complaintId).set(data);

    saveIssueData(imageUrl);

    addIssue(data);
  }

  toggle() {
    setState(() {
      tap = !tap;
    });
  }

  void saveIssueData(String imageUrl) async {
    Map<String, String?> data = {
      "imageUrl": imageUrl,
      "latitude": lat.toString(),
      "longitude": long.toString(),
      "queries": additionalInfoController.text,
      "name": _name,
      "phone number": _phone,
      "email": _email,
      "complaintID": complaintId,
    };
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString(
      complaintId,
      jsonEncode(data),
    );
  }
}
