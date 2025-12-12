import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windenergy/features/presentation/widgets/logo_small.dart';
import 'package:windenergy/features/presentation/widgets/windenergy_button.dart';
import 'package:windenergy/features/presentation/widgets/windenergy_textfield.dart';
import 'package:windenergy/ui/couleurs.dart';

class AjouterEoliennePage extends StatelessWidget {
  const AjouterEoliennePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: LogoSmall(),
        backgroundColor: couleurFond,
      ),
      body: Container(
        color: couleurFond,
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              "Nouvelle Eoliènne",
              textAlign: TextAlign.center,
              style: GoogleFonts.hammersmithOne(
                color: couleurPrincipale,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Numéro Serie",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: couleurPrincipale,
              ),
            ),
            SizedBox(height: 10),
            WindenergyTextField(hintText: "numero serie"),
            SizedBox(height: 20),
            Text(
              "Hash Securité",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: couleurPrincipale,
              ),
            ),
            SizedBox(height: 10),
            WindenergyTextField(hintText: "mot de passe", obscureText: true,enabled: false,),
            SizedBox(height: 30),
            WindenergyButton(libelle: "enregister", onPressed: () {}),
            SizedBox(height: 30),
            WindenergyButton(
              libelle: "retour à l'écran principale",
              outlineOnly: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
