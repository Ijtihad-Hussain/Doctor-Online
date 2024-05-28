import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/doctor_side/chat_controller.dart';

class AppUser {
  final String name;
  AppUser({required this.name});
}

class ChatScreen extends StatelessWidget {
  final AppUser currentUser;
  final AppUser selectedUser;

  ChatScreen({super.key, required this.currentUser, required this.selectedUser});

  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedUser.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              controller: chatController.scrollController,
              itemCount: chatController.messages.length,
              itemBuilder: (context, index) {
                final message = chatController.messages[index];
                return ListTile(
                  title: Text(message),
                );
              },
            )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: chatController.selectAndShareFile,
                ),
                Expanded(
                  child: TextField(
                    controller: chatController.textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: chatController.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


