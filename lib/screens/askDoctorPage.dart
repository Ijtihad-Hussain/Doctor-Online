import 'package:flutter/material.dart';

import '../widgets/button.dart';

class AskDoctorPage extends StatelessWidget {
  const AskDoctorPage({Key? key}) : super(key: key);

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
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Type your question here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Button(
              onPressed: (){

              },
              buttonText: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
