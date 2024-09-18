import 'package:auth/pages/home_page.dart';
import 'package:auth/pages/login_or_register_page.dart';
import 'package:auth/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          print("Auth state changed. Has data: ${snapshot.hasData}");
          //is the user logged in
          if (snapshot.hasData){
            print("Home page returned");
            return HomePage();
          }
          //is the user not logged in
          else{
            print("no login page");
            return LoginOrRegisterPage();
          }
        }
      ),
    );
  }
}