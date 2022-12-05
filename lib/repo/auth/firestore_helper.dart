import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/models/user.dart';

class FireStoreHelper{
  FireStoreHelper._();
  static FireStoreHelper fireStoreHelper = FireStoreHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addNewUser(UserModel user){
    firestore.collection('users').doc(user.id).set(user.toMap());

  }

  Future<UserModel?> getUser(String id) async {
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await firestore.collection('users').doc(id).get();
    if (documentSnapshot != null){
return UserModel.fromMap(documentSnapshot.data()!);
    }
    else{
      return null;
    }
    
  }
}