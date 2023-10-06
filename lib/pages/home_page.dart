import 'package:a_check/pages/controllers/home_state.dart';
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
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("A-Check"),
              ),
              Expanded(
                child: ValueListenableBuilder<Box>(
                  valueListenable: HiveBoxes.classesBox().listenable(),
                  builder: (context, box, _) {
                    final castedBox = box.values.cast();

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
          animatedIconTheme: const IconThemeData(size: 24),
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.add_comment),
                label: 'Add Class',
                onTap: state.addClass),
          ],
        ));
  }
}
