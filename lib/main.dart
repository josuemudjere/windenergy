import 'package:flutter/material.dart';
import 'package:windenergy/features/presentation/pages/ajouter_eolienne.dart';
import 'package:windenergy/features/presentation/pages/authentification_page.dart';
import 'package:windenergy/features/presentation/pages/liste_eoliennes.dart';

void main() {
  runApp(MaterialApp(
    title: 'windenergy',
    routes:<String,WidgetBuilder>{
      '/':(BuildContext context)=> AuthentificationPage(),
      '/enregistrer':(BuildContext context) => Container(),
      '/liste_eolienne':(BuildContext context) => ListeEoliennesPage(),
      '/eolienne':(BuildContext context) => Container(),
      '/ajouter_eolienne':(BuildContext context) => AjouterEoliennePage()
    }
  ));
}