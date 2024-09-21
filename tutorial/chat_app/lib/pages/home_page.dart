import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot){
        //error
        if(snapshot.hasError){
          return const Text("Error");
        }
        //loading
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading..");
        }

        //return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem).toList(),
        );
      }
    );
  }

  //build individual list tile  for user
}