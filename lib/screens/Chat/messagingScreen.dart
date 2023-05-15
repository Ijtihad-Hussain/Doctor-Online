import 'package:flutter/material.dart';
import '../../models/message.dart';
import '../../models/user.dart';

class MessagingScreen extends StatefulWidget {
  final AppUser currentUser;
  final AppUser selectedUser;

  MessagingScreen({required this.currentUser, required this.selectedUser});

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedUser.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              Navigator.pushNamed(context, '/video_call');
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              Navigator.pushNamed(context, '/audio_call');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return message.sender == widget.currentUser.id
                    ? _buildSentMessage(message)
                    : _buildReceivedMessage(message);
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            decoration: BoxDecoration(color: Theme
                .of(context)
                .cardColor),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Type a message'),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = _textEditingController.text.trim();
                    if (text.isNotEmpty) {
                      final message = Message(
                        sender: widget.currentUser,
                        receiver: widget.selectedUser,
                        text: text,
                        messageType: MessageType.text,
                      );
                      setState(() {
                        messages.add(message);
                      });
                      _textEditingController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSentMessage(Message message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8, left: 80),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          child: Text(
            message.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReceivedMessage(Message message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.selectedUser.avatarUrl),
        ),
        const SizedBox(width: 8),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8, right: 80),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: message.messageType == MessageType.text
              ? Text(
            message.text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )
              : Row(
            children: [
              const Icon(Icons.insert_drive_file),
              const SizedBox(width: 8),
              Text(
                message.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}