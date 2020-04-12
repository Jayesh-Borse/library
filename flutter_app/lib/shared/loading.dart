import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //color: Color.fromRGBO(3,9,20, 1),
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.blueGrey,
          size: 50.0,
        ),
      ),
    );
  }
}