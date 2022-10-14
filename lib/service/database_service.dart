import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
//UpDate user data

  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");
//saving user data
  Future savingUserData(
    String fullname,
    String email,
  ) async {
    return await userCollection.doc(uid).set({
      "fullName": fullname,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }

  //Geting user data from database to find if the use exists
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

//get user group
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }
}
