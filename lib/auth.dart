import 'package:a_check/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
            showAuthActionSwitch: false,
            headerBuilder: (context, constraints, shrinkOffset) => Container(
              constraints: constraints,
              padding: const EdgeInsets.all(20.0),
              child: const Image(
                  image: AssetImage("assets/images/logo_blue.png"), height: 60),
            ),
          );
        }

        return const HomeScreen();
      },
    );
  }
}
