import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  ListItem(this.title, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        this.onTap();
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
