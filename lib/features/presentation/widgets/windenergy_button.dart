import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windenergy/ui/couleurs.dart';

class WindenergyButton extends StatelessWidget {
  void Function()? onPressed;
  final String libelle;


  WindenergyButton({super.key,this.libelle="",required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: couleurPrincipale,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        libelle,
        style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
