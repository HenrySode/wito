import 'package:flutter/material.dart';
// import 'package:wito/pages/auth_page.dart';
// import 'package:wito/pages/sing_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wito/pages/auth_page.dart';
// import 'package:wito/pages/nyumbani_page.dart';
// import 'package:wito/pages/sign_up.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(
          // onTap: () {},
          ),
    );
  }
}
