import 'package:flutter/material.dart';
import 'package:mugapp_v1/Pages/Setup/signIn.dart';
import 'package:mugapp_v1/Pages/Setup/signUp.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MugApp Classroom App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(  //sign in button
              onPressed: navigateToSignIn,
              child: Text('Sign In'),
            ),
            RaisedButton(  //sign up button
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => SignUpPage(),fullscreenDialog: true));
              },
              child: Text('Sign Up'),
            ),
            
            /*RaisedButton(  //sign in with google button
              onPressed: (){}, //redirect to authentication
              child: Text('Sign In with Google'),
            ),*/

        ],),
    );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage(),fullscreenDialog: true));
  }

}