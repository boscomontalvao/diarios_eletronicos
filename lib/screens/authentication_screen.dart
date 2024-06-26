import 'package:diarios_eletronicos/screens/year_search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class AuthenticationScrenn extends StatelessWidget {
  const AuthenticationScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const SignInScreen();
        }
        return const YearSearchScreen();
      }),
    );
  }
}
