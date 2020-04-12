import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/book.dart';
import 'package:flutter_app/models/users.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/book.dart';
import 'package:flutter_app/screens/home/book_list.dart';
import 'package:flutter_app/screens/authenticate/pictlogin_scraper.dart';
import 'package:flutter_app/services/firebasemessaging.dart';
import 'package:flutter_app/screens/home/searchbook.dart';

class Home extends StatelessWidget {
  
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        //backgroundColor: Color.fromRGBO(3,9,20, 1),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: AppBar(
            title: Text('Library',
             style: GoogleFonts.montserrat(),
            ),
            backgroundColor: Colors.black,
            elevation: 0.0,
            bottom: TabBar(
              indicatorColor: Colors.blueGrey,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.book,color: Colors.white,)),
                Tab(icon: Icon(Icons.search,color: Colors.white,)),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BookList(),
            SearchBook(),
            //PictLogin(),
//             FirebaseMessagingNotif(),
            //Text("Other one Selected", style: TextStyle(color: Colors.white),),
          ],
        ),

        drawer: Drawer(
          elevation: 20.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 250.0,
                child: DrawerHeader(
                  child: Center(child: Image.asset('assets/images/lib.png')),
                  ),
              ),
              ListTile(
                title: Text(
                      'My Profile',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {
                      
                    },
              ),
              ListTile(
                    title: Text(
                      'Paid History',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Settings',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Refer Friends',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'About',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Rate Us',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  ListTile(
                    title: Text(
                      'Log out',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () async {
                      final user = Provider.of<User>(context, listen: false);
                      await _auth.signout(user.uid);
                    },
                  ),
            ],
          ),
          ),
      ),
    ));
  }
}
