import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<Map<String, dynamic>> fetchDataFromFirebase(String path) async {
  // Initialize Firebase (assuming you have already configured it)
  await Firebase.initializeApp();

  // Create a reference to the desired location in the database
  final databaseReference = FirebaseDatabase.instance.reference().child(path);

  // Get a snapshot of the data at that location
  final event = await databaseReference.once();

  // Check if data exists
  if (event.snapshot.value != null) {
    // Convert the snapshot value (which is a Map) to a Dart Map
    return event.snapshot.value as Map<String, dynamic>;
  } else {
    // Handle the case where no data is found
    print('No data found at the specified path');
    return {};
  }
}

void runnun() async {
  // Replace 'your_data_path' with the actual path to your JSON data
  final data = await fetchDataFromFirebase("issue");

  // Access the data using the Map interface

  print(data.toString()); // Assuming your JSON data has a key 'key1'
}
