import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/task.dart';
import 'package:school_planner/theme/app_theme.dart';

class CustomBottomSheet extends GetView<SchoolController> {
  final AnimateIconController fabController = AnimateIconController();

  int i = 1;
  void onAddTaskPressed() {
    controller.addTask(
      Task(
        name: 'Prova ${i++} de Matemática',
        date: DateTime.now(),
      ),
    );
  }

  void onAddSubjectPressed() {
    controller.addSubject(
      Subject(
        backgroundImage: 'https://picsum.photos/seed/789/300',
        name: 'Cálculo ${i++}',
        professor: 'Daniela',
      ),
    );
  }

  late List<Widget> _items;

  CustomBottomSheet() {
    _items = [
      ListItem('Adicionar matéria', FontAwesomeIcons.graduationCap,
          onAddSubjectPressed),
      Divider(),
      ListItem('Adicionar tarefa', FontAwesomeIcons.bookOpen, onAddTaskPressed),
      Divider(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: shrinePink100,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
        itemCount: _items.length,
        itemBuilder: (context, index) => _items[index],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  ListItem(this.title, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onTap();
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(this.icon),
            SizedBox(
              width: 20,
            ),
            Container(
              child: Text(
                this.title,
                style: GoogleFonts.aBeeZee(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
