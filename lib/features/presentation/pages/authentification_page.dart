import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windenergy/features/presentation/blocs/blocks.dart';
import 'package:windenergy/features/presentation/blocs/events.dart';
import 'package:windenergy/features/presentation/blocs/states.dart';
import 'package:windenergy/features/presentation/widgets/logo.dart';
import 'package:windenergy/features/presentation/widgets/windenergy_button.dart';
import 'package:windenergy/features/presentation/widgets/windenergy_textfield.dart';
import 'package:windenergy/ui/couleurs.dart';
import 'package:windenergy/ui/utils.dart';

class AuthentificationPage extends StatefulWidget {
  AuthentificationPage({super.key});
  @override
  State<AuthentificationPage> createState() => _AuthentificationPage();
}

class _AuthentificationPage extends State<AuthentificationPage> {
  final sl = GetIt.instance;

  final emailController = TextEditingController();
  final motDePasseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: couleurFond,
        child: BlocProvider(
          create: (context) => sl<AuthentifierBloc>(),
          child: BlocListener<AuthentifierBloc, WindenergyState>(
            listener: (context, state) {
              if (state is EchecState) {
                afficherMessage(context, state.message, true);
              } else if (state is SuccesState) {
                afficherMessage(context, "Connexion réussie", false);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed('/liste_eolienne');
                  }
                });
              }
            },
            child: BlocBuilder<AuthentifierBloc, WindenergyState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return afficherLoader(context);
                }
                return afficherFormulaire(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget afficherLoader(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
      child: Column(
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(color: couleurPrincipale),
          ),
          SizedBox(height: 10),
          Text(
            "connexion",
            style: GoogleFonts.inter(fontSize: 14, color: couleurPrincipale),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView afficherFormulaire(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Logo(),
            SizedBox(height: 50),
            Text(
              "E-mail",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: couleurPrincipale,
              ),
            ),
            SizedBox(height: 10),
            WindenergyTextField(hintText: "email", controller: emailController),
            SizedBox(height: 20),
            Text(
              "Mot de passe",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: couleurPrincipale,
              ),
            ),
            SizedBox(height: 10),
            WindenergyTextField(
              hintText: "mot de passe",
              obscureText: true,
              controller: motDePasseController,
            ),

            SizedBox(height: 30),
            WindenergyButton(
              libelle: "Se connecter",
              onPressed: () {
                final email = emailController.text;
                final motDePasse = motDePasseController.text;
                if (email.isEmpty) {
                  afficherMessage(context, "Le champ E-mail est vide", true);
                } else if (motDePasse.isEmpty) {
                  afficherMessage(
                    context,
                    "Le champ Mot de passe est vide",
                    true,
                  );
                } else {
                  BlocProvider.of<AuthentifierBloc>(context).add(
                    AuthentifierEvent(motDePasse: motDePasse, email: email),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              "pas encore enregistré?",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: couleurPrincipale, fontSize: 14),
            ),
            SizedBox(height: 20),
            WindenergyButton(
              libelle: "S'enregistrer",
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/enregistrer');
              },
            ),
          ],
        ),
      ),
    );
  }
}
