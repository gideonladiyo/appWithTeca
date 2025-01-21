import 'package:chatapp/service/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/collections/image_col.dart';
import '../../login/widgets/my_textfield.dart';

class UserInputWidget extends StatefulWidget {
  final TextEditingController messageController;
  final FocusNode focusNode;
  final VoidCallback onSendMessage;
  final String receiverID;

  const UserInputWidget({
    Key? key,
    required this.messageController,
    required this.focusNode,
    required this.onSendMessage,
    required this.receiverID
  }) : super(key: key);

  @override
  State<UserInputWidget> createState() => _UserInputWidgetState();
}

class _UserInputWidgetState extends State<UserInputWidget> {
  final ChatService _chatService = ChatService();

  bool _isExpanded = false;
  List<String> stickerData = [
    ImageCol.belangbelang,
    ImageCol.bubududu1,
    ImageCol.bubududu2,
    ImageCol.bubududu3,
    ImageCol.bubududu4,
    ImageCol.bubududu5,
    ImageCol.bubududu6,
    ImageCol.bubududu7,
    ImageCol.bubududu8,
    ImageCol.bubududu9,
    ImageCol.bubududu10,
    ImageCol.bubududu11,
    ImageCol.bubududu12,
    ImageCol.bubududu13,
  ];

  void sendSticker(String stickerURL) async {
    _chatService.sendSticker(widget.receiverID, stickerURL);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                _isExpanded ? Icons.keyboard_arrow_down : Icons.insert_emoticon,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            Expanded(
              child: MyTextfield(
                hint: "Type a message",
                textController: widget.messageController,
                focusNode: widget.focusNode,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: widget.onSendMessage,
                icon: const Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ),
          ],
        ),
        if (_isExpanded)
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Jumlah sticker per baris
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: stickerData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    sendSticker(stickerData[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                      child: Image.asset(
                        stickerData[index],
                        fit: BoxFit.contain,
                      ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}