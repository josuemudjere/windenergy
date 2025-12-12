import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windenergy/features/presentation/widgets/eolienne_anime.dart';
import 'package:windenergy/features/presentation/widgets/eolienne_miniature.dart';
import 'package:windenergy/features/presentation/widgets/logo_small.dart';
import 'package:windenergy/ui/couleurs.dart';

class ListeEoliennesPage extends StatelessWidget {
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
        height: 100,
        width: 100,
        child: EolienneAnime(),
      ),
    );
  }
}