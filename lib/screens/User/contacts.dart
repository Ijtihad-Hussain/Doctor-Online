import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../models/user.dart';
import '../../widgets/contactBox.dart';
import '../doctorSide/chat/chatScreen.dart';
import '../doctorSide/contacts.dart';

class _ContactsState extends State<Contacts> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late DocumentSnapshot<Map<String, dynamic>> userData;

  final CollectionReference doctorsCollection =
  FirebaseFirestore.instance.collection('doctors');

  @override
  void initState() {
    print(_auth.currentUser?.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: doctorsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final doctors = snapshot.data!.docs;

          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index].data() as Map<String, dynamic>;
              final name = doctor['name'] ?? '';
              final email = doctor['email'] ?? '';
              final userId = doctor['userId'] ?? '';
              final avatarUrl = doctor['avatarUrl'] ??
                  'https://i.pravatar.cc/150?img=$index';

              // Get the current user ID
              final currentUserId = _auth.currentUser?.uid;

              // Create the current user instance
              final currentUser = AppUser(
                id: currentUserId ?? '',
                name: 'sender',
                avatarUrl: 'https://media.istockphoto.com/id/464628845/photo/womans-hand-pulling-envelop-from-mailbox.jpg?b=1&s=612x612&w=0&k=20&c=m051Ot-qEYxPxQhgfN6nP_LAitFowHXGq5I69nEcOvE=',
              );

              // Create the selected user instance
              final selectedUser = AppUser(
                id: userId,
                name: name,
                avatarUrl: avatarUrl,
              );

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        currentUser: currentUser,
                        selectedUser: selectedUser,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ContactBox(
                    color: Colors.white70,
                    name: name,
                    lastMessage: email,
                    avatarUrl: avatarUrl,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
