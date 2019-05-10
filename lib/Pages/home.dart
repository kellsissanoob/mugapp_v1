import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Home'),
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Welcome, you are logged in'),
              SizedBox(
                height: 15.0,
              ),
              new OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red, style: BorderStyle.solid, width: 3.0
                ),
                child: Text ('Logout'),
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((value){
                    Navigator.of(context).pushReplacementNamed('/landingpage');
                  }).catchError((e){
                    print(e);
                  });
                },
              )
            ],
          ),
        ),
      )
    );
  }
}