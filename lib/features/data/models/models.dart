import 'package:windenergy/features/domain/entities/entities.dart';

class UtilisateurModel extends Utilisateur {
  const UtilisateurModel({
    super.authId,
    super.idUtilisateur,
    super.email,
    super.nom,
    super.prenom,
  });

  UtilisateurModel.fromJSON(Map<String, dynamic> json)
    : super(
        authId: json["authId"]! as String,
        idUtilisateur: json["idUtilisateur"]! as int,
        email: json["email"]! as String,
        nom: json["nom"]! as String,
        prenom: json["prenom"]! as String,
      );

  Map<String, dynamic> toJSON() {
    var ret = <String, dynamic>{};
    ret["authId"] = authId;
    ret["idUtilisateur"] = idUtilisateur;
    ret["email"] = email;
    ret["nom"] = nom;
    ret["prenom"] = prenom;
    return ret;
  }
}

class EolienneModel extends Eolienne {
  EolienneModel({
    super.idUtilisateur,
    super.actif,
    super.hashSecurite,
    super.numeroSerie,
    super.orientation,
    super.puissanceGenere,
    super.tempsDerniereMesure,
    super.vitesseRotation,
  });

  EolienneModel.fromJSON(Map<String, dynamic> json)
    : super(
        idUtilisateur: json["idUtilisateur"]! as int,
        actif: json["actif"]! as bool,
        hashSecurite: json["hashSecurite"]! as String,
        numeroSerie: json["numeroSerie"]! as String,
        orientation: json["orientation"]! as double,
        puissanceGenere: json["puissanceGenere"]! as double,
        tempsDerniereMesure: DateTime.fromMillisecondsSinceEpoch(
          json["tempsDerniereMesure"]! as int,
        ),
        vitesseRotation: json["vitesseRotation"]! as double,
      );

  Map<String, dynamic> toJSON() {
    var nouveauTemps = 0;
    if (tempsDerniereMesure != null) {
      nouveauTemps = tempsDerniereMesure!.millisecondsSinceEpoch;
    }

    return <String, dynamic>{
      "idUtilisateur": idUtilisateur,
      "actif": actif,
      "hashSecurite": hashSecurite,
      "numeroSerie": numeroSerie,
      "orientation": orientation,
      "puissanceGenere": puissanceGenere,
      "tempsDerniereMesure": nouveauTemps,
      "vitesseRotation":vitesseRotation
    };
  }
}
