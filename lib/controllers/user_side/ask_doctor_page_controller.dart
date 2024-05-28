import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AskDoctorController extends GetxController {
  final TextEditingController questionController = TextEditingController();
  var questions = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSavedQuestions();
  }

  Future<void> submitQuestion() async {
    final question = questionController.text.trim();
    if (question.isNotEmpty) {
      try {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          final userId = currentUser.uid;

          // Retrieve user's name from Firestore "users" collection
          final userSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();
          final userName = userSnapshot.data()?['name'];

          final questionData = {
            'question': question,
            'userId': userId,
            'userName': userName,
            'timestamp': FieldValue.serverTimestamp(),
          };

          await FirebaseFirestore.instance
              .collection('questions')
              .add(questionData);

          questions.add(question);
          questionController.clear();
        }
      } catch (error) {
        // Handle error if saving to Firestore fails
        print('Failed to save question: $error');
      }
    }
  }

  Future<void> getSavedQuestions() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('questions')
          .orderBy('timestamp', descending: true)
          .get();

      questions.value = querySnapshot.docs.map((doc) => doc.data()['question'].toString()).toList();
    } catch (error) {
      // Handle error if fetching from Firestore fails
      print('Failed to fetch questions: $error');
    }
  }
}
