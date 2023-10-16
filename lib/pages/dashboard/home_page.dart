import 'package:a_check/main.dart';
import 'package:a_check/models/class.dart';
import 'package:a_check/pages/dashboard/controllers/home_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/widgets/class_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomeState();
}

class HomeView extends WidgetView<HomePage, HomeState> {
  const HomeView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Image(
                          image: AssetImage("assets/images/LOGO.png"), height: 56),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("A-Check", style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),),
                        Text(packageInfo.version)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ValueListenableBuilder<Box>(
                  valueListenable: HiveBoxes.classesBox().listenable(),
                  builder: (context, box, _) {
                    final castedBox = box.values.cast<Class>();

                    return GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(8),
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 8,
                      children:
                          castedBox.map((e) => ClassCard(mClass: e)).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: const IconThemeData(size: 27),
          backgroundColor: Colors.green[900],
          foregroundColor: Colors.lightGreen,
          spacing: 10.00,
          childMargin: const EdgeInsets.all(10),
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.add_comment),
                label: 'Add Class',
                foregroundColor: Colors.green[900],
                onTap: state.addClass),
          ],
        ));
  }
}
