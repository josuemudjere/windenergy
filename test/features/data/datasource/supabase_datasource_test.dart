import 'package:flutter_test/flutter_test.dart';
import 'package:supamock/supamock.dart';
import 'package:windenergy/core/exceptions/exceptions.dart';
import 'package:windenergy/core/resultat/resultat.dart';
import 'package:windenergy/features/data/datasources/supabase_datasource.dart';
import 'package:windenergy/features/data/models/models.dart';

void main() {
  late SupaMock supaMock;
  late SupabaseDatasource supabaseDatasource;

  setUp(() {
    supaMock = SupaMock();
  });

  group("tests pour ajouterEolienne", () {
    test("devrait retourner un Succes", () async {
      Map<String,dynamic> expected = {
        "idUtilisateur": 1,
        "actif": true,
        "hashSecurite": "0",
        "numeroSerie": "0",
        "orientation": "0",
        "puissanceGenere": "0",
        "tempsDerniereMesure": 0,
        "vitesseRotation": "0",
      }; 

      supabaseDatasource = SupabaseDatasource(
        supaMock.mockInsertSelectTable(reponse: [expected]),
      );
      var actual = await supabaseDatasource.ajouterEolienne("0");
      expect(actual, Succes(expected));
    });
  });

  group("tests pour authentifier", () {
    test("devrait retourner un Succes", () async {
      final expected = Succes(true);
      supabaseDatasource = SupabaseDatasource(supaMock.mockSignin());
      var actual = await supabaseDatasource.authentifier("", "");
      expect(actual, expected);
    });
    test("devrait lancer un ServerException", () async {
      supabaseDatasource = SupabaseDatasource(
        supaMock.mockSigninWithException(),
      );
      expect(
        () => supabaseDatasource.authentifier("", ""),
        throwsA(const TypeMatcher<ServerException>()),
      ); // Vérifie si un ServerException est bien lancé.
    });
  });

  group("tests pour enregistrer", () {
    test("devrait retourner un Succes", () async {
      final expected = Succes(true);
      supabaseDatasource = SupabaseDatasource(supaMock.mockSignup());
      var actual = await supabaseDatasource.enregistrer("", "", "", "");
      expect(actual, expected);
    });
    test("devrait lancer un ServerException", () async {
      supabaseDatasource = SupabaseDatasource(
        supaMock.mockSignupWithException(),
      );
      expect(
        () => supabaseDatasource.enregistrer("", "", "", ""),
        throwsA(const TypeMatcher<ServerException>()),
      ); // Vérifie si un ServerException est bien lancé.
    });
  });

   group("tests pour consulterEtatEolienne", () {
    test("devrait retourner un Succes", () async {
      Map<String,dynamic> expected = {
        "idUtilisateur": 1,
        "actif": true,
        "hashSecurite": "0",
        "numeroSerie": "0",
        "orientation": 0.0,
        "puissanceGenere": 0.0,
        "tempsDerniereMesure": 0,
        "vitesseRotation": 0.0,
      };
      supabaseDatasource = SupabaseDatasource(
        supaMock.mockSelectTable(response: [expected]),
      );
      var actual = await supabaseDatasource.consulterEtatEolienne(0);
      expect(actual, Succes(EolienneModel.fromJSON(expected)));
    });
  });

  group("tests pour consulterListeEoliennes", () {
    test("devrait retourner un Succes", () async {
      Map<String,dynamic> expected = {
        "idUtilisateur": 1,
        "actif": true,
        "hashSecurite": "0",
        "numeroSerie": "0",
        "orientation": 0.0,
        "puissanceGenere": 0.0,
        "tempsDerniereMesure": 0,
        "vitesseRotation": 0.0,
      };
      supabaseDatasource = SupabaseDatasource(
        supaMock.mockSelectTable(response: [expected]),
      );
      var actual = await supabaseDatasource.consulterListeEoliennes();
      expect(actual, Succes([EolienneModel.fromJSON(expected)]));
    });
  });
}
