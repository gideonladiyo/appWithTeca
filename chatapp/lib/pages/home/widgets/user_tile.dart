import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String profileUrl;
  final String text;
  final void Function()? onTap;

  const UserTile({super.key, required this.text, required this.onTap, required this.profileUrl});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 15,
              offset: Offset(0, 10)
            )
          ]
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  profileUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              "Chat with $text",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
