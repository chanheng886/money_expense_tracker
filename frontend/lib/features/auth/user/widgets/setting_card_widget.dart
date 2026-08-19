import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget settingCardWidget(
  String title,
  FaIconData leading,
  VoidCallback onPress,
) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    child: ListTile(
      onTap: () {
        onPress();
      },
      leading: FaIcon(leading, size: 16, color: Color(0xff1E293B)),
      title: Text(
        title,
        style: GoogleFonts.dmSans(fontSize: 16, color: Color(0xff1E293B)),
      ),
      trailing: FaIcon(
        FontAwesomeIcons.angleRight,
        size: 16,
        color: Color(0xff1E293B),
      ),
    ),
  );
}
