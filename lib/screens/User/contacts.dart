import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tele_consult/models/user.dart';
import 'package:tele_consult/screens/Chat/messagingScreen.dart';
import 'package:tele_consult/widgets/contactBox.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

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
              final doctor =
              doctors[index].data() as Map<String, dynamic>;
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
                name: '',
                avatarUrl: 'https://i.pravatar.cc/150?img=2',
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
                      builder: (context) => MessagingScreen(
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
