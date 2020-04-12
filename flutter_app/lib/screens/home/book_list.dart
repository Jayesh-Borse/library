import 'package:flutter/material.dart';
import 'package:flutter_app/models/book.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/screens/home/book_tile.dart';
import 'package:flutter_app/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/shared/loading.dart';

import 'package:html/parser.dart';
//import 'package:flutter_app/widgets/provider_widget.dart';
import 'package:flutter_app/services/auth.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {


    final user= Provider.of<User>(context);


      return StreamBuilder(
        stream: getUserBookStreamSnapshot(context),
        builder: (context, snapshot) {
          print(snapshot);
          if(!snapshot.hasData) return Loading();
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
                return BookTile(book: snapshot.data.documents[index]);
            },
          );
        }
      );
    }
  }

  Stream<QuerySnapshot> getUserBookStreamSnapshot(BuildContext context) async* {
    final user= Provider.of<User>(context, listen: false);
    String uid = user.uid;
    print("UID is : ");
    print(user.uid);
    DocumentReference doc = Firestore.instance.collection('UserList').document(uid);
    DocumentSnapshot userRef = await doc.get();
    final String pictid = userRef.data['pictid'];

    yield* Firestore.instance.collection('Users').document(pictid).collection('books').snapshots();
  }


