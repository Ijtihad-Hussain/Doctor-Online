import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user.dart';

class ContactsController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var users = <AppUser>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  void fetchContacts() async {
    try {
      final snapshot = await firestore.collection('users').get();
      final List<AppUser> userList = snapshot.docs.map((doc) {
        final data = doc.data();
        return AppUser(
          id: data['userId'] ?? '',
          name: data['name'] ?? '',
          email: data['email'] ?? '',
          avatarUrl: data['avatarUrl'] ?? 'https://i.pravatar.cc/150?img=${doc.id}',
        );
      }).toList();

      users.value = userList;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching contacts: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  AppUser getCurrentUser() {
    final currentUser = _auth.currentUser;
    return AppUser(
      id: currentUser?.uid ?? '',
      name: 'sender',
      avatarUrl: 'https://media.istockphoto.com/id/464628845/photo/womans-hand-pulling-envelop-from-mailbox.jpg?b=1&s=612x612&w=0&k=20&c=m051Ot-qEYxPxQhgfN6nP_LAitFowHXGq5I69nEcOvE=',
    );
  }
}
