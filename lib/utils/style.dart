import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size,Color color,FontWeight fontWeight){
  return GoogleFonts.montserrat(fontSize: size,color: color,fontWeight: fontWeight);
}