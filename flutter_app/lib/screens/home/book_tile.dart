import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/book.dart';
import 'package:google_fonts/google_fonts.dart';

class BookTile extends StatelessWidget {

  final DocumentSnapshot book;
  BookTile({this.book});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
          child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          elevation: 20.0,
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Color.fromRGBO((book['deadline'])*100, -(book['deadline'])*100-50, 0, 1),
            ),
      
            title: Text(book['name'],
            style: GoogleFonts.openSans(
              fontSize: 27.0,
              fontStyle: FontStyle.normal,
            ),
            ),
            subtitle: Text(book['author'] + '   Days Left : ${book['deadline']}',
              style: GoogleFonts.openSans(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
