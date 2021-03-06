import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/home.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/users.dart';

//void main() => runApp(MaterialApp(
//  theme: ThemeData(primaryColor: Colors.red,accentColor: Colors.greenAccent),
//  debugShowCheckedModeBanner: false,
//  home: SplashScreen(),
//));

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
//      home: SplashScreen(),
      ),
    );
  }
}



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AnimationController _controller;


  @override
  Widget build(BuildContext context) {
    final double width  = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(3,9,20, 1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                        "Let's Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(height: 60,),
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue.withOpacity(.4),
                      ),
                      child: ClipOval(
                        child: MaterialButton(
                          height: 100,
                          minWidth: 100,
                          onPressed: () {},
                          color: Colors.lightBlue,
                          splashColor: Colors.grey[100],
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 29,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60,),
                ],
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
