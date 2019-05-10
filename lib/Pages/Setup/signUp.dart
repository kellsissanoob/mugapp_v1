import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mugapp_v1/Pages/Setup/user.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
    String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),    
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty)
                {
                  return 'Please type valid email';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText:'Email'
              ),
            ),

            TextFormField(
              validator: (input){
                if(input.length < 6)
                {
                  return 'You Need to have at least 6 characters in your password';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                labelText:'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              child: Text('Sign Up'),
              onPressed: () {
                FirebaseAuth.instance
                  .createUserWithEmailAndPassword(email: _email, password: _password)
                .then((signedInUser)
                {
                  User().storeNewUser(signedInUser,context);
                })
                .catchError((e){
                print(e);
              });
              },
            ),
          ],
          )
      )
    );
  }
}