import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatController extends GetxController {
  var messages = <String>[].obs;
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> selectAndShareFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      await Firebase.initializeApp();
      final pickedFile = result.files.first;
      final fileBytes = pickedFile.bytes;
      final fileName = pickedFile.name;
      final storage = FirebaseStorage.instance;
      final storageRef = storage.ref().child('files/$fileName');
      final uploadTask = storageRef.putData(fileBytes!);
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      final downloadURL = await snapshot.ref.getDownloadURL();

      messages.add(downloadURL);
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void sendMessage() {
    final text = textEditingController.text;
    if (text.isNotEmpty) {
      messages.add(text);
      textEditingController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
