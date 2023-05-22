import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:wito/pages/nyumbani_page.dart';
import 'package:wito/pages/sign_in_or_up.dart';
// import 'package:wito/pages/sing_in.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is signed in
          if (snapshot.hasData) {
            return NyumbaniPage();
          }
          //user is not signed in
          else {
            return const SignInOrSignUpPage();
          }
        },
      ),
    );
  }
}
