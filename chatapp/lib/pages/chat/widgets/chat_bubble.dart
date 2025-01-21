import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  String message;
  bool isCurrentUser;
  bool isText;
  ChatBubble({super.key, required this.message, required this.isCurrentUser, required this.isText});

  @override
  Widget build(BuildContext context) {
    return isText
        ? Container(
      decoration: BoxDecoration(
          color: isCurrentUser ? Colors.green : Colors.grey.shade500,
          borderRadius: BorderRadius.circular(12)
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(message),
    )
        : Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(12)
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Image.asset(
        message
      ),
    );
  }
}
