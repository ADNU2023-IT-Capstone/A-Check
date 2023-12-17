import 'package:a_check/auth.dart';
import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/utils/validators.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => LoginPageView(this);

  @override
  void initState() {
    super.initState();

    emailCon = TextEditingController();
    passwordCon = TextEditingController();
  }

  School? selectedSchool;
  Future<List<School>> getSearchedItems(String text) async {
    final schools = (await schoolsRef.get()).docs.map((e) => e.data).toList();

    return schools.where((e) => e.name.contains(text)).toList();
  }

  void onDropdownChanged(School? value) {
    setState(() => selectedSchool = value);
  }

  String? validateDropdown(School? value) {
    if (value == null) {
      return "This field cannot be left blank!";
    }

    return null;
  }

  final formKey = GlobalKey<FormState>();
  late TextEditingController emailCon, passwordCon;

  void login() async {
    if (!formKey.currentState!.validate()) return;

    try {
      await auth.signIn(
          school: selectedSchool!,
          email: emailCon.text,
          password: passwordCon.text);
    } on AuthException catch (e) {
      snackbarKey.currentState!.showSnackBar(
          SnackBar(content: Text(e.message ?? "Error! ${e.code}")));
    }
  }
}

class LoginPageView extends WidgetView<LoginPage, LoginPageState> {
  const LoginPageView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
                image: AssetImage("assets/images/small_logo_blue.png"),
                height: 100),
            const Text(
              "Log in to A-Check",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            buildForm(),
          ],
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
        key: state.formKey,
        child: Column(
          children: [
            DropdownSearch<School>(
              dropdownBuilder: _customDropDownSchool,
              popupProps: PopupProps.modalBottomSheet(
                  itemBuilder: (context, item, isSelected) {
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.officeName),
                      selected: isSelected,
                    );
                  },
                  showSearchBox: true,
                  showSelectedItems: true,
                  searchFieldProps: const TextFieldProps(
                      decoration: InputDecoration(
                    isDense: true,
                    labelText: "Search school...",
                    border: OutlineInputBorder(),
                  ))),
              asyncItems: state.getSearchedItems,
              itemAsString: (item) => item.name,
              compareFn: (item1, item2) => item1.id == item2.id,
              onChanged: state.onDropdownChanged,
              selectedItem: state.selectedSchool,
              validator: state.validateDropdown,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: state.emailCon,
              validator: Validators.isAnEmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                labelText: "Teacher Email",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: state.passwordCon,
              validator: Validators.hasValue,
              obscureText: true,
              obscuringCharacter: '•',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.black54,
                  size: 20,
                ),
                labelText: "Password",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // hoverColor: const Color(0xff153faa).withOpacity(0.8),
              // highlightColor: const Color(0xff153faa).withOpacity(0.4),
              // splashColor: const Color(0xff153faa).withOpacity(1),
              onTap: state.login,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  // adding color will hide the splash effect
                  color: const Color(0xff153faa),
                ),
                child: const Text(
                  "Log in",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _customDropDownSchool(BuildContext context, School? item) {
    return Container(
        child: (item == null)
            ? const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: Color(0xff828282),
                      size: 23,
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Text("Find your school",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff828282))),
                  ],
                ),
              )
            : ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  item.name,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                subtitle: Text(
                  item.officeName,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ));
  }
}
