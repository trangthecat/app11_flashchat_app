import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app11_flashchat_app/components/widgetbutton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/icons/ic.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration: kbuildInputDecoration('Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kbuildInputDecoration('Enter your password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              NewWidgetButton(
                  color: Colors.lightBlueAccent,
                  voidCallback: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final signInUser = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
                      if(signInUser!=null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e){
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                  string: 'Log In'),
            ],
          ),
        ),
      ),
    );
  }
}
