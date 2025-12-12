import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windenergy/features/domain/entities/entities.dart';
import 'package:windenergy/ui/couleurs.dart';

class EolienneMiniature extends StatelessWidget {
  final Eolienne eolienne;
  const EolienneMiniature({
    super.key,
    required this.eolienne
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: couleurFondSecondaire,
            border: Border.all(color: couleurPrincipale),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        SizedBox(height: 10),
        Text(
          eolienne.numeroSerie,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 14, color: couleurPrincipale),
        ),
        SizedBox(height: 5),
        Text(
          eolienne.actif? "actif":"inactif",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: eolienne.actif? couleurSucces:couleurAlerte,
          ),
        ),
      ],
    );
  }
}
