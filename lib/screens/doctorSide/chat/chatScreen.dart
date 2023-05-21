import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../models/user.dart';

// Assuming you have a class for the chat screen
class ChatScreen extends StatefulWidget {
  final AppUser currentUser;
  final AppUser selectedUser;

  ChatScreen({required this.currentUser, required this.selectedUser});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = []; // List of chat messages
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void _selectAndShareFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // User has selected a file
      // Implement the logic to share the file (e.g., upload to Firebase Storage and send the file URL in the chat)

      // Initialize Firebase
      await Firebase.initializeApp();

      // Access the selected file details
      final pickedFile = result.files.first;
      final fileBytes = pickedFile.bytes;
      final fileName = pickedFile.name;

      // Create a reference to Firebase Storage
      final storage = FirebaseStorage.instance;
      final storageRef = storage.ref().child('files/$fileName');

      // Upload the file to Firebase Storage
      final uploadTask = storageRef.putData(fileBytes!);

      // Wait for the upload to complete
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

      // Get the download URL of the uploaded file
      final downloadURL = await snapshot.ref.getDownloadURL();

      // Add the download URL to the chat messages
      setState(() {
        messages.add(downloadURL);
      });

      // Scroll to the bottom of the chat
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedUser.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    _selectAndShareFile(context);
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final text = _textEditingController.text;
                    if (text.isNotEmpty) {
                      // Send the message
                      setState(() {
                        messages.add(text);
                        _textEditingController.clear();
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
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
}

