import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context){
    //get auth service
    final _auth = AuthService();
    if (_passwordController.text == _confirmController.text){
      try{
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text
        );
      } catch (e){
        showDialog(
          context: context,
          builder: (context)=> AlertDialog(
            title: Text(e.toString()),
          ),
        ) ;
      }
    }else{
      showDialog(
        context:context,
        builder: (context)=> AlertDialog(
          title: Text("Passwords dont match!"),
        )
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            //logo
            Icon(
              Icons.chat,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height:50),
            //welcome back message
            Text(
              "Let's create an account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize:16,
              ),
            ),

            const SizedBox(height:50),
            //email textfield
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
              focusNode: FocusNode(),
              ),
            const SizedBox(height:20),
            //pw textfield
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
              focusNode: FocusNode(),
              ),
            const SizedBox(height:20),
            MyTextfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmController,
              focusNode: FocusNode(),
              ),
            const SizedBox(height:20),
            //login button
            MyButton(
              text: "Register",
              onTap:()=> register(context),
            ),
            const SizedBox(height:25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary,
                ),
                ),
                GestureDetector(
                  onTap:onTap,
                  child: Text("Login now", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    ),
                    ),
                ),
              ],
            )
          ]
        ),
      ),
    );
 
  }
}