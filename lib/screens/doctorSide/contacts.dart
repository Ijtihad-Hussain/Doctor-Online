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

  Future<Map<String, dynamic>?> getUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // No user is signed in
      return null;
    }

    userData = await FirebaseFirestore.instance
        .collection('doctors')
        .doc(user.uid)
        .get();

    if (!userData.exists) {
      // Document doesn't exist
      return null;
    }

    final Map<String, dynamic>? data = userData.data();
    print("${user.uid}${userData.data()?['name']}");
    return data;
  }


  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('Users');

  @override
  void initState() {
    getUserData();
    print(_auth.currentUser?.uid);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index].data() as Map<String, dynamic>;
              final name = user['name'] ?? '';
              final email = user['email'] ?? '';
              final userId = user['userId'] ?? '';
              final avatarUrl = user['avatarUrl'] ??
                  'https://i.pravatar.cc/150?img=$index';
              final selectedUser =
              AppUser(id: userId, name: name, avatarUrl: avatarUrl);
              final currentUser = AppUser(
                id: _auth.currentUser!.uid,
                name: '',
                avatarUrl: 'https://i.pravatar.cc/150?img=2',
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