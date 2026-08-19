import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget recentTransactionWidget({
  FaIconData? icon,
  required String title,
  required String subTitle,
  required double money,
}) {
  return Card(
    color: Colors.white,
    child: ListTile(
      minTileHeight: 80,
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: FaIcon(icon, color: Color(0xff45474C))),
      ),
      title: Text(
        title,
        style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(subTitle, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: Text(
        money < 0
            ? "-$money"
            : money == 0
            ? "$money"
            : "+$money",
        // style: money < 0 ? Color(0xffEF4444) : Color(0xff10B981),
        style: money < 0
            ? GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xffEF4444),
              )
            : GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff10B981),
              ),
      ),
    ),
  );
}
