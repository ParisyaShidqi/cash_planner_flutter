import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CashPlannerTextstyles {
  TextStyle smallNormal = GoogleFonts.poppins().copyWith(fontSize: 12);
  TextStyle normalNormal = GoogleFonts.poppins().copyWith(fontSize: 15);
  TextStyle largeNormal = GoogleFonts.poppins().copyWith(fontSize: 20);
  TextStyle extraLargeNormal = GoogleFonts.poppins().copyWith(fontSize: 35);

  TextStyle smallBold =
      GoogleFonts.poppins().copyWith(fontSize: 12, fontWeight: FontWeight.bold);
  TextStyle normalBold =
      GoogleFonts.poppins().copyWith(fontSize: 15, fontWeight: FontWeight.bold);
  TextStyle largeBold =
      GoogleFonts.poppins().copyWith(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle extraLargeBold =
      GoogleFonts.poppins().copyWith(fontSize: 35, fontWeight: FontWeight.bold);
}
CashPlannerTextstyles cashPlannerTextstyles = CashPlannerTextstyles();
