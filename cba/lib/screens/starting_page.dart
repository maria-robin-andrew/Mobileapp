import 'package:cba/screens/register_page.dart';
import 'package:flutter/material.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/st.jpg",
                  fit: BoxFit.cover,
                  height: 320,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Tribute your Contribution to make a World Better",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              const Icon(
                Icons.camera,
                size: 40,
                color: Colors.grey,
              )
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: const Color(0xff358FEA)),
                    child: const Text(
                      "Get Started",
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
}
