import 'package:auth/auth_services.dart';
import 'package:auth/components/my_button.dart';
import 'package:auth/components/my_textfield.dart';
import 'package:auth/components/square_tile.dart';
import 'package:auth/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign user in method
  void signUserUp() async{
    //show dialog circle
    showDialog(
      context:context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    try{
      if(passwordController.text==confirmPasswordController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
    );
      }
    else{
      showErrorMessage("Passwords dont match!");
    }
    Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
    
    
    
  }

  void showErrorMessage(String message){
    showDialog(
      context:context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message, 
              style: const TextStyle(color: Colors.white),
              )),
        );
      },
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children:[
              const SizedBox(height:50),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50,),
              //Welcome back, you've been missed
            Text('Welcome back you\' ve been missed!',
            style: TextStyle(
              color:Colors.grey[700],
              fontSize:16,
              ),
            ),
            const SizedBox(height:25),
              //username textfield
            MyTextfield(
              controller: emailController,
              hintText: 'Username',
              obscureText: false,
            ),
            
            
              //password textfield
            const SizedBox(height: 25,),
            MyTextfield(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height:10),

            MyTextfield(
              controller: confirmPasswordController, 
              hintText: 'Confirm Password', 
              obscureText: true
              ),
            
           
            const SizedBox(height:15),
              //sign in button
            MyButton(
              text: "Sign Up",
              onTap: signUserUp,
            ),
              //or continue with
            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children:[
                  Expanded(
                    child:Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Or continue with"),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )
                )
                ],
              ),
            ),
            SizedBox(height:20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(
                  imagePath: 'lib/assets/google_logo.png',
                  onTap: ()=> AuthService().signInWithGoogle()),
                const SizedBox(width:20),
                  SquareTile(
                    imagePath:'lib/assets/apple_logo.jpg',
                    onTap: (){}), 
              ],
            ),
            const SizedBox(height:50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width:4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login Now',
                    style: TextStyle(
                      color:Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]
            )
                    
              //google + sign in buttons
            ]
            ),
          ),
        ),
      )
    );
  }
}