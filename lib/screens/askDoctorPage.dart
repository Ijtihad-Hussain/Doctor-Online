import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AskDoctorPage extends StatefulWidget {
  const AskDoctorPage({Key? key}) : super(key: key);

  @override
  _AskDoctorPageState createState() => _AskDoctorPageState();
}

class _AskDoctorPageState extends State<AskDoctorPage> {
  final TextEditingController _questionController = TextEditingController();
  List<String> _questions = [];

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  void _submitQuestion() async {
    final question = _questionController.text.trim();
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

          setState(() {
            _questions.add(question);
          });
          _questionController.clear();
        }
      } catch (error) {
        // Handle error if saving to Firestore fails
        print('Failed to save question: $error');
      }
    }
  }

  Future<List<String>> _getSavedQuestions() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('questions')
        .orderBy('timestamp', descending: true)
        .get();

    final questions = querySnapshot.docs.map((doc) => doc.data()['question'].toString()).toList();
    return questions;
  }

  @override
  void initState() {
    super.initState();
    _getSavedQuestions().then((questions) {
      setState(() {
        _questions = questions;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Doctor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ask your question',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _questionController,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Type your question here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitQuestion,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Asked Questions:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_questions[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
