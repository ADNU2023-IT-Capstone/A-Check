import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

final storage = FirebaseStorage.instance;