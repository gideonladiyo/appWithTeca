import 'package:chatapp/pages/home/widgets/my_drawer.dart';
import 'package:chatapp/pages/home/widgets/user_tile.dart';
import 'package:chatapp/service/auth/auth_service.dart';
import 'package:chatapp/service/chat/chat_service.dart';
import 'package:flutter/material.dart';

import '../chat/chat_page.dart';

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

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(receiverEmail: userData['email'], receiverID: userData['uid'],)));
        },
      );
    } else {
      return Container();
    }
  }
}
