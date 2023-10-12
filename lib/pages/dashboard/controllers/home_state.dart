import 'package:a_check/pages/forms/class_form_page.dart';
import 'package:a_check/pages/dashboard/home_page.dart';
import 'package:flutter/material.dart';

class HomeState extends State<HomePage> {
  void addClass() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ClassFormPage()));
  }

  @override
  Widget build(BuildContext context) => HomeView(this);
}
