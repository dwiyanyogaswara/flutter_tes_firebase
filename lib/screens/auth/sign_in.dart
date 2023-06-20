import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes_firebase/services/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String resultx = '-';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              UserCredential result = await _auth.signInAnon();
              if (result == null) {
                print('error sign in');
              } else {
                print('signed in');
                print(result);
                setState(() {
                  resultx = result.user!.uid.toString();
                });
              }
            },
            child: Text(resultx),
          ),
        ),
      ),
    );
  }
}
