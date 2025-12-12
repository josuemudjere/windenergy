import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windenergy/ui/couleurs.dart';

class LogoSmall extends StatelessWidget {
  const LogoSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(
          "design/logo.svg",
          width: 43,
          height: 39,
          colorFilter: ColorFilter.mode(couleurPrincipale, BlendMode.srcIn),
        ),
        SizedBox(width: 10),
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