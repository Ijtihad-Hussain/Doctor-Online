import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/doctor_side/contacts_controller.dart';
import '../../widgets/contact_box.dart';
import '../user_side/chat/messaging_screen.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactsController controller = Get.put(ContactsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.users.isEmpty) {
          return const Center(child: Text('No contacts found.'));
        }

        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];
            final currentUser = controller.getCurrentUser();

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagingScreen(
                      currentUser: currentUser,
                      selectedUser: user,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContactBox(
                  color: Colors.white70,
                  name: user.name,
                  lastMessage: user.email,
                  avatarUrl: user.avatarUrl,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

