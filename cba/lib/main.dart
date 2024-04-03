import 'package:cba/blocs_file/fire_bloc.dart';
import 'package:cba/blocs_file/firey_bloc.dart';
import 'package:cba/blocs_file/issue_bloc/issue_bloc.dart';
import 'package:cba/repository/firebase_repository.dart';
import 'package:cba/repository/repos.dart';
import 'package:cba/screens/dashboard.dart';
import 'package:cba/screens/register_page.dart';
import 'package:cba/screens/starting_page.dart';
import 'package:cba/themes/themes.dart';
import 'package:cba/utils/shared_preference_functions.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IssueBloc()),
        BlocProvider(
          create: (context) =>
              DatabaseBloc(FirebaseRepository(FirebaseDatabase.instance)),
        ),
        BlocProvider(create: (context) => DatafireBloc(FireyRepository())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: const StartingPage()),
    );
  }
}

class Starting extends StatelessWidget {
  const Starting({super.key});

  Future<bool> check() async {
    String? phone = await loadData('phone');
    await Future.delayed(const Duration(seconds: 2));
    if (phone != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var f = check();
    if (f == true) {
      return const Dashboard();
    } else {
      return const RegisterPage();
    }
  }
}
