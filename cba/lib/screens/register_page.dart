import 'package:cba/screens/dashboard.dart';

import 'package:cba/utils/shared_preference_functions.dart';
import 'package:cba/widgets/snackbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController codeOTP = TextEditingController();
  String vid = "";

  OutlineInputBorder textFieldBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 0, 128, 254),
      width: 1.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Envirowatch",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 19,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 240, 240, 240),
                      filled: true,
                      hintText: "",
                      label: const Text(
                        "Name",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 254),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 240, 240, 240),
                      filled: true,
                      hintText: "@example.com",
                      label: const Text(
                        "Email",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 254),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 240, 240, 240),
                      filled: true,
                      hintText: "+91 ----------",
                      label: const Text(
                        "Phone no.",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 254),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                              "+91${phoneNumberController.text.trim()}",
                          verificationCompleted:
                              (PhoneAuthCredential phoneAuthCredential) async {
                            await FirebaseAuth.instance
                                .signInWithCredential(phoneAuthCredential);
                          },
                          verificationFailed: (FirebaseAuthException error) {
                            showSnackBar(BuildContext, error.code);
                          },
                          codeSent: (String verificationId,
                              int? forceResendingToken) {
                            setState(() {
                              vid = verificationId;
                            });
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            setState(() {
                              vid = verificationId;
                            });
                          },
                        );
                      },
                      child: const Text(
                        "Generate code",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 254),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  child: TextField(
                    controller: codeOTP,
                    // enabled: vis,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 240, 240, 240),
                      filled: true,
                      hintText: "------",
                      label: const Text(
                        "Code",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 254),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 1, 1),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () async {
                        PhoneAuthCredential pac = PhoneAuthProvider.credential(
                            verificationId: vid, smsCode: codeOTP.text.trim());
                        var val = await FirebaseAuth.instance
                            .signInWithCredential(pac);
                        if (val.user != null) {
                          saveData(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              phoneNumberController.text.trim());
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: const Color(0xff358FEA)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        saveData(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            phoneNumberController.text.trim());
                        Future.delayed(const Duration(seconds: 2));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()));
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: const Color(0xff358FEA)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
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
