import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;  
  UserModel({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
  });

  UserModel copyWith({
    String? id,
    String? fName,
    String? lName,
    String? phone,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fName': fName,
      'lName': lName,
      'phone': phone,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      fName: map['fName'] != null ? map['fName'] as String : null,
      lName: map['lName'] != null ? map['lName'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, fName: $fName, lName: $lName, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.fName == fName &&
      other.lName == lName &&
      other.phone == phone &&
      other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fName.hashCode ^
      lName.hashCode ^
      phone.hashCode ^
      email.hashCode;
  }
}
