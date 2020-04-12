import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app/models/book.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/models/users.dart';
class DatabaseService{
  //
  final String uid;
  DatabaseService({this.uid});


  //Collection reference
  final CollectionReference bookCollection = Firestore.instance.collection('Users');
  final CollectionReference userCollection = Firestore.instance.collection('UserList');

  Future updateUserData(String name, String author, int deadline) async {
    return await bookCollection.document(uid).collection('books').document(author).setData({
      'name' : name,
      'author' : author,
      'deadline' : deadline,
      'uid' : uid,
    });
  }

  Future addDeviceToken() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String dev_tok = await _firebaseMessaging.getToken();
    return await userCollection.document(uid).updateData({
      'device_token' : dev_tok,
    });
  }

  Future removeDeviceToken() async {
    return await userCollection.document(uid).updateData({
      'device_token' : FieldValue.delete(),
    });

  }

  Future updateUserList(String pictid) async {
//    if(userCollection.document(pictid).get() == null)
    if(true){
      return await userCollection.document(uid).setData({
        'pictid' : pictid,
      });
    }
    else {
      return null;
    }
  }


}
