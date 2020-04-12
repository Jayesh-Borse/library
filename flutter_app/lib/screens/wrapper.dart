import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/authenticate.dart';
import 'package:flutter_app/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/users.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user= Provider.of<User>(context);
    print(user);
    //Return home or authenticate
    if(user == null)
      return Authenticate();
    else
      return Home();
  }
}
