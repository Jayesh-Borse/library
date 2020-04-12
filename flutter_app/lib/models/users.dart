import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  final CollectionReference userCollection = Firestore.instance.collection('UserList');
  User({this.uid});

  Future<User> getUser() async {
    var doc = await userCollection.document(uid).get();
    print(doc);
    return this;

  }

}