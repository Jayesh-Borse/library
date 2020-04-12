import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/users.dart';
import 'package:flutter_app/services/database.dart';
import 'package:http/http.dart';
import 'package:flutter_app/services/firebasemessaging.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User object
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
//    return _auth.onAuthStateChanged.map((FirebaseUser user)=>_userFromFirebaseUser(user));
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Get UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }


  //Sign in anon
  Future signinAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //sign with mail and pswd
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
//      FirebaseMessagingNotif();
      await DatabaseService(uid : user.uid).addDeviceToken();
      return _userFromFirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  //red with mail ans pswd
  Future registerWithEmailAndPassword(String email, String password, String pictid) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      var existingPictid = await checkCreds(pictid, password);
      if(existingPictid == true) {
        //Create a new document for user with uid
        await DatabaseService(uid : user.uid).updateUserList(pictid);
        await DatabaseService(uid : user.uid).updateUserData('0', 'author', 0);
        return _userFromFirebaseUser(user);
      }
      else {
        user.delete();
        print("object");
        return null;
      }
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> checkCreds(String pictid, String Password) async {
    String url = 'https://pict.ethdigitalcampus.com/DCWeb/authenticate.do?loginid='+pictid+'&password='+Password+'&dbConnVar=PICT&service_id=';
    Response response = await get(url);
    if(response.body.length == 6671)
      return false;
    else
      return true;
  }


  //sign out
  Future signout(String uid) async{
    try {
      print(_auth.currentUser());
      await DatabaseService(uid : uid).removeDeviceToken();
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}