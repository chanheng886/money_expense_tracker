import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardWidget(String title, FaIconData icon, String subTitle) {
  return Card(
    child: Container(
      height: 120,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon),
            Text(
              title,
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.grey),
            ),
            Text(subTitle, style: GoogleFonts.dmSans(fontSize: 16)),
          ],
        ),
      ),
    ),
  );
}
