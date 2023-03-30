import 'dart:convert';

class UserModel {
  int id = 0;
  String email = '';
  String nom = '';
  String prenom = '';
  String sexe = '';
  String type = '';
  String picture = '';
  String telephone = '';
  String birthDate = ''; //toMap //FromMap ---> birth_date
  String adress = '';

  factory UserModel.initial() => UserModel(
      id: -1,
      email: "",
      nom: "",
      prenom: "",
      sexe: "",
      type: "LOCATAIRE",
      picture: '',
      telephone: '',
      birthDate: '',
      adress: ''
  );

  UserModel({
    required this.id,
    required this.email,
    required this.nom,
    required this.prenom,
    required this.sexe,
    required this.type,
    required this.picture,
    required this.telephone,
    required this.birthDate,
    required this.adress,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? nom,
    String? prenom,
    String? sexe,
    String? type,
    String? picture,
    String? telephone,
    String? birthDate,
    String? adress,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      sexe: sexe ?? this.sexe,
      type: type ?? this.type,
      picture: picture ?? this.picture,
      telephone: telephone ?? this.telephone,
      birthDate: birthDate ?? this.birthDate,
      adress: adress ?? this.adress,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    result.addAll({'nom': nom});
    result.addAll({'prenom': prenom});
    result.addAll({'sexe': sexe});
    result.addAll({'type': type});
    result.addAll({'picture': picture});
    result.addAll({'telephone': telephone});
    result.addAll({'birth_date': birthDate});
    result.addAll({'adress': adress});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      sexe: map['sexe'] ?? '',
      type: map['type'] ?? '',
      picture: map['picture_url'] ?? '',
      telephone: map['telephone'] ?? '',
      birthDate: map['birth_date'] ?? '',
      adress: map['adress'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, nom: $nom, prenom: $prenom, sexe: $sexe, type: $type, picture: $picture, telephone: $telephone, birthDate: $birthDate, adress: $adress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.nom == nom &&
        other.prenom == prenom &&
        other.sexe == sexe &&
        other.type == type &&
        other.picture == picture &&
        other.telephone == telephone &&
        other.birthDate == birthDate &&
        other.adress == adress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        nom.hashCode ^
        prenom.hashCode ^
        sexe.hashCode ^
        type.hashCode ^
        picture.hashCode ^
        telephone.hashCode ^
        birthDate.hashCode ^
        adress.hashCode;
  }
}
