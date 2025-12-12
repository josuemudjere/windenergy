import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windenergy/ui/couleurs.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        SvgPicture.asset(
          "design/logo.svg",
          width: 69,
          height: 63,
          colorFilter: ColorFilter.mode(couleurPrincipale, BlendMode.srcIn),
        ),
        SizedBox(height: 10),
        Text(
          "Wind Energy",
          textAlign: TextAlign.center,
          style: GoogleFonts.hammersmithOne(
            color: couleurPrincipale,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
