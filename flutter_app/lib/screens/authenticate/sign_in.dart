import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/shared/constants.dart';
import 'package:flutter_app/shared/loading.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  //Text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Text(''),
                        SizedBox(height: 100.0),
                        Image.asset('assets/images/boook.jpg'),
                        Text(
                          '  LEARN  LEAD  GROW',
                          style: GoogleFonts.openSans(),
                        ),
                        SizedBox(height:50.0),
                        TextFormField(
                          onTap: (){
                            FocusScopeNode currentFocus = FocusScope.of(context);
                            if(!currentFocus.hasPrimaryFocus){
                            currentFocus.unfocus();
                            }
                          },
                          focusNode: myFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          decoration:InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'Email',
                            labelStyle: GoogleFonts.openSans(
                              fontSize: 19.0,
                              color: myFocusNode.hasFocus ? Colors.black:Colors.black
                            )
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          onTap: (){
                            FocusScopeNode currentFocus1 = FocusScope.of(context);
                            if(!currentFocus1.hasPrimaryFocus){
                              currentFocus1.unfocus();
                            }
                          },
                          focusNode: myFocusNode1,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          decoration:InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'Password',
                            labelStyle: GoogleFonts.openSans(
                              fontSize: 19.0,
                              color: myFocusNode1.hasFocus ? Colors.black:Colors.black
                            )
                          ),
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
                              print('valid');
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Could not Sign In with those credentials';
                                });
                              }
                            }
                          },
                          child: Center(
                            child:Container(
                              decoration: BoxDecoration(
                                color:Colors.black,
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
                                child:Text('Sign In',
                                style:GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ) ,
                                ) ,
                                ),
                            ),
                          ),

                        ),

                        SizedBox(height:6.0),
                        FlatButton(
                          onPressed:() async {
                             widget.toggleView();
                          } , 
                          child: Text(
                            'New User ? Sign Up',
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
            ),
          );
  }
}
