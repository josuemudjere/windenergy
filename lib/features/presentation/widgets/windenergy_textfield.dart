import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windenergy/ui/couleurs.dart';

class WindenergyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  TextEditingController? controller;

  WindenergyTextField({super.key, this.hintText = "", this.controller, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: couleurFondSecondaire,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: couleurSecondaire),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(color: couleurPrincipale, fontSize: 14),
      ),
    );
  }
}
