import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:windenergy/ui/couleurs.dart';

class EolienneAnime extends StatefulWidget {
  final bool actif;
  const EolienneAnime({super.key, this.actif = false});

  @override
  State<EolienneAnime> createState() => _EolienneAnimeState();
}

// La classe _EolienneAnimeState implémente les mixin SingleTickerProviderStateMixin afin de cadencer l'animation. Cette classe nous fournit un Ticker.
class _EolienneAnimeState extends State<EolienneAnime>
    with SingleTickerProviderStateMixin {
  late AnimationController
  _controller; // Permet de controller l'execution de l'animation
  late Animation<double> _animation; // Représente l'animation elle-même.

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    if (widget.actif) {
      _controller.repeat();
    }

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(17, 30, 0, 0),
          child: SvgPicture.asset(
            "design/mat_eolienne.svg",
            width: 11,
            height: 28,
            colorFilter: ColorFilter.mode(couleurPrincipale, BlendMode.srcIn),
          ),
        ),
        RotationTransition(
          turns: _animation,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "design/pales_eolienne.svg",
            width: 45,
            height: 45,
            colorFilter: ColorFilter.mode(couleurPrincipale, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
