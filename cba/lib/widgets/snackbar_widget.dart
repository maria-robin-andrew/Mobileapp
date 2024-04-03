import 'package:flutter/material.dart';

showSnackBar(context, text) {
  // Enum colour = {Colors.red, Colors.blue, Colors.green};

  SnackBar snackBar = SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    ),
    backgroundColor: const Color.fromARGB(155, 0, 148, 254),
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(10.0),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
