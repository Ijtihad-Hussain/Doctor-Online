
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_side/ask_doctor_page_controller.dart';

class AskDoctorPage extends StatelessWidget {
  const AskDoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AskDoctorController controller = Get.put(AskDoctorController());

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
              controller: controller.questionController,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Type your question here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.submitQuestion,
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
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.questions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.questions[index]),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

