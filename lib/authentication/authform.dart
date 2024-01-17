import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

//----------------------------------------------------------
  final _formkey = GlobalKey<FormState>();
  String?  _email = " ";
  String? _password = " ";
  String? _username = " ";
  bool isLoginPage = false;
//----------------------------------------------------------

startauthentication() async{
  final validity = _formkey.currentState!.validate();
  FocusScope.of(context).unfocus();
  _formkey.currentState!.save();
  submitform();
}
submitform() async{
  final auth = FirebaseAuth.instance;
}


//-----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Form(
            key: _formkey,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                if (!isLoginPage)
 //---------------------------------------------------------------
                TextFormField(
                keyboardType: TextInputType.emailAddress,
                key: ValueKey('username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Incorrect Username";
                  }
                  return null;
                },
                onSaved: (value){
                  _username = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                    borderSide: new BorderSide()
                  ),
                  labelText: "Enter Username",
                  labelStyle: GoogleFonts.roboto()
                ),

              ),
//--------------------------------------------------------

              Padding(padding: EdgeInsets.only(top: 10.0)), 

                TextFormField(
                keyboardType: TextInputType.emailAddress,
                key: ValueKey('email'),
                validator: (value) {
                  if (value!.isEmpty || value!.contains("@")) {
                    return " Incorrect Email";
                  }
                  return null;
                },
                onSaved: (value){
                  _email = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                    borderSide: new BorderSide()
                  ),
                  labelText: "Enter Email",
                  labelStyle: GoogleFonts.roboto()
                ),

              ),
 //------------------------------------------------------

              Padding(padding: EdgeInsets.only(top: 10.0)),
               TextFormField(
                keyboardType: TextInputType.emailAddress,
                key: ValueKey('password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Incorrect Password";
                  }
                  return null;
                },
                onSaved: (value){
                  _password = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                    borderSide: new BorderSide()
                  ),
                  labelText: "Enter password",
                  labelStyle: GoogleFonts.roboto()
                ),

              ),
 //-------------------------------------------------------------
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)),
            child: ListView(children: [
              ElevatedButton(
                onPressed: (){}, 
                child: isLoginPage? Text('Login', style: GoogleFonts.roboto(fontSize: 16),) : Text('SignUp', style: GoogleFonts.roboto(fontSize: 16),),
                )
            ],),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isLoginPage = !isLoginPage;
              });
            } ,
            child: isLoginPage? Text('Not a member'): Text('Already a member'),)          
            ],
            ),
          ),
        )
      ],
      ),
    );
  }
}