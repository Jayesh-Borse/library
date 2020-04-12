import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/shared/constants.dart';
import 'package:flutter_app/shared/loading.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  //Text field state
  String email = '';
  String pictid = '';
  String password = '';
  String error = '';
  bool loading = false;

  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
          resizeToAvoidBottomPadding: false,
//       backgroundColor: Color.fromRGBO(3,9,20, 1),
// //    backgroundColor: Colors.red,
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0.0,
//         title: Text('Sign Up'),
//         actions: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.person, color: Colors.white,),
//             label: Text('Sign In', style: TextStyle(color: Colors.white)),
//             onPressed: () async {
//               widget.toggleView();
//             } ,
//           )
//         ],
//       ),
            body: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formkey,
                  child: Column(
                    
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Text(
                        'REGISTER',
                        style: GoogleFonts.openSans(
                          fontSize: 50.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Divider(),
                      SizedBox(height: 40.0),
                      TextFormField(
                        onTap: () {
                          FocusScopeNode currentFocus0 = FocusScope.of(context);
                          if (!currentFocus0.hasPrimaryFocus) {
                            currentFocus0.unfocus();
                          }
                        },
                        focusNode: myFocusNode2,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'Email',
                            labelStyle: GoogleFonts.openSans(
                                fontSize: 19.0,
                                color: myFocusNode2.hasFocus
                                    ? Colors.black
                                    : Colors.black)),
                        validator: (val) =>
                            val.isEmpty ? 'Enter a Email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                         onTap: () {
                          FocusScopeNode currentFocus2 = FocusScope.of(context);
                          if (!currentFocus2.hasPrimaryFocus) {
                            currentFocus2.unfocus();
                          }
                        },
                        focusNode: myFocusNode3,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'PICT ID Number',
                            labelStyle: GoogleFonts.openSans(
                                fontSize: 19.0,
                                color: myFocusNode3.hasFocus
                                    ? Colors.black
                                    : Colors.black)),
                        validator: (val) =>
                            val.length < 11 ? 'Enter a correct ID' : null,
                        onChanged: (val) {
                          setState(() => pictid = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        onTap: () {
                          FocusScopeNode currentFocus3 = FocusScope.of(context);
                          if (!currentFocus3.hasPrimaryFocus) {
                            currentFocus3.unfocus();
                          }
                        },
                        focusNode: myFocusNode4,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'Password',
                            labelStyle: GoogleFonts.openSans(
                                fontSize: 19.0,
                                color: myFocusNode4.hasFocus
                                    ? Colors.black
                                    : Colors.black)),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a Password with atleast 6 characters'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      new GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    email, password, pictid);
                            print(result);
                            if (result == null) {
                              setState(() {
                                print("Here");
                                loading = false;
                                error = 'Enter valid email';
                              });
                            }
                          }
                        },
                        child: Center(
                          child:Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(40.0),
                                  topRight: const Radius.circular(40.0),
                                  bottomLeft: const Radius.circular(40.0),
                                  bottomRight: const Radius.circular(40.0),
                                ),
                            ),
                            padding: EdgeInsets.all(10.0),
                            width: 500.0,
                            height: 60.0,
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style:GoogleFonts.openSans(
                                  color:Colors.white,
                                  fontSize: 20.0, 
                                ),
                              ),
                            ),
                          ) ,
                          ),
                      ),

                      // RaisedButton(
                      //   color: Colors.lightBlue,
                      //   child: Text(
                      //     'Sign Up',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onPressed: () async {
                      //     if (_formkey.currentState.validate()) {
                      //       setState(() => loading = true);
                      //       dynamic result =
                      //           await _auth.registerWithEmailAndPassword(
                      //               email, password, pictid);
                      //       print(result);
                      //       if (result == null) {
                      //         setState(() {
                      //           print("Here");
                      //           loading = false;
                      //           error = 'Enter valid email';
                      //         });
                      //       }
                      //     }
                      //   },
                      // ),
                      SizedBox(height:6.0),
                        FlatButton(
                          onPressed:() async {
                             widget.toggleView();
                          } , 
                          child: Text(
                            'Existing User ? Sign In',
                            style: GoogleFonts.openSans())
                          ),
                      SizedBox(height: 20.0),
                      Text(
                        error,
                        style: GoogleFonts.openSans(
                            color: Colors.red,
                            fontSize: 14.0,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}






