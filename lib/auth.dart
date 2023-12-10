import 'dart:async';

import 'package:a_check/home_screen.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

class User {
  User({
    required this.id,
    required this.schoolId,
  });

  String id;
  String schoolId;

  @override
  String toString() {
    return "User: ${id}, School ID: ${schoolId}";
  }
}

class AuthException implements Exception {
  String code;
  String? message;

  AuthException(this.code, [this.message]);
}

class Auth {
  User? _loggedInUser;
  User? get currentUser => _loggedInUser;

  late StreamController<User?> _userController;
  Stream<User?> get userStream => _userController.stream;

  Auth({User? user}) {
    _userController = StreamController<User?>.broadcast();

    if (user != null) {
      _loggedInUser = user;
      _userController.add(user);
    }
  }

  printUserFromStream() async {
    print(await userStream.first ?? "No user");
  }

  Future<User> signIn(
      {required School school,
      required String email,
      required String password}) async {
    // check if teacher exists
    final teachersDocs =
        (await school.ref.teachers.whereEmail(isEqualTo: email).get()).docs;
    if (teachersDocs.isEmpty) {
      throw AuthException("InvalidEmail", "Invalid email");
    } else if (teachersDocs.length > 1) {
      throw AuthException("DuplicateEmail", "Email has more than one record");
    }
    print('found teacher');

    // check if password is correct
    final teacher = teachersDocs.first.data;
    if (!teacher.authenticate(password)) {
      throw AuthException("InvalidPassword", "Invalid password");
    }
    print('credentials are correct');

    // if all pass, set as current user
    final user = User(id: teacher.id, schoolId: school.id);
    await prefs.setStringList('user', [teacher.id, school.id]);

    _loggedInUser = user;
    _userController.add(user);
    return user;
  }

  signOut() async {
    _loggedInUser = null;
    await prefs.remove('user');

    _userController.add(null);
  }

  void dispose() {
    _userController.close();
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.userStream,
      initialData: auth.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoginPage();
        }

        return const HomeScreen();
      },
    );
  }
}
