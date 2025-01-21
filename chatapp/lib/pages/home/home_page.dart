import 'package:chatapp/pages/home/widgets/my_drawer.dart';
import 'package:chatapp/pages/home/widgets/row_two.dart';
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
    final currentUser = _authService.getCurrentUser();
    bool isTeca = currentUser?.email == "teca@gmail.com";
    String profileUrl = isTeca
        ? 'https://i.pinimg.com/736x/99/52/55/995255833858260a9b72704161ce1d8d.jpg'
        : 'https://i.pinimg.com/736x/5f/b1/7d/5fb17dc4075377974c3e4170610ce469.jpg';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      drawer: MyDrawer(),
      body: _buildHomePage(profileUrl),
    );
  }

  Widget _buildHomePage(String profileUrl) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: _buildUserList(profileUrl),
        ),
        const SizedBox(height: 20),
        const RowTwo(),
      ],
    );
  }

  Widget _buildUserList(String profileUrl) {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return _buildUserListItem(snapshot.data![index], context, profileUrl);
          },
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context, String profileUrl) {
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        profileUrl: profileUrl,
        text: userData['name'],
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(receiverName: userData['name'], receiverID: userData['uid'], profileUrl: profileUrl,)));
        },
      );
    } else {
      return Container();
    }
  }
}
