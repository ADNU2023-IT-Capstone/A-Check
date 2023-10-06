import 'package:a_check/pages/home_page.dart';
import 'package:a_check/pages/settings_page.dart';
import 'package:a_check/pages/students_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavbarSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      keepPage: true,
    );

    void pageChanged(int index) {
      setState(() {
        bottomNavbarSelectedIndex = index;
      });
    }

    Widget buildPageView() {
      return PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [HomePage(), StudentsPage(), Placeholder(), SettingsPage()],
        onPageChanged: (index) {
          pageChanged(index);
        },
      );
    }

    void bottomNavbarTapped(int index) {
      setState(() {
        bottomNavbarSelectedIndex = index;
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
      });
    }

    List<BottomNavigationBarItem> bottomNavbarItems = const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.group), label: "Students"),
      BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month), label: "Calendar"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
    ];

    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomNavbarItems,
          currentIndex: bottomNavbarSelectedIndex,
          onTap: (index) {
            bottomNavbarTapped(index);
          }),
    );
  }
}