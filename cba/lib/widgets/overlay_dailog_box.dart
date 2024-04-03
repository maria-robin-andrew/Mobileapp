import 'package:flutter/material.dart';

// class DialogBox extends StatefulWidget {
//   const DialogBox({super.key});

//   @override
//   State<DialogBox> createState() => _DialogBoxState();
// }

// class _DialogBoxState extends State<DialogBox> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('This is a dialog box'),
//           const SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               closed = true;
//               Navigator.of(context).pop();
//             },
//             child: const Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }
// }
bool closed = false;

void showDialogBox(BuildContext context) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: 250.0,
        left: 20.0,
        width: MediaQuery.of(context).size.width - 40.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('This is a dialog box'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  print(closed);
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);

  // Remove the overlay after 5 seconds
  // Timer(const Duration(seconds: 5), () {
  //   overlayEntry.remove();
  // });

  if (closed == true) {
    overlayEntry.remove();
    closed = false;
    print(closed);
  }
}
