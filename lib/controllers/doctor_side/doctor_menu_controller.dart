import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorMenuController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var userName = 'Doctor Online'.obs;
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentUserName();
    isLoggedIn.value = _auth.currentUser != null;
  }

  Future<void> getCurrentUserName() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String? userEmail = user.email;
      DocumentSnapshot userSnapshot = await _firestore
          .collection('users')
          .doc(userEmail)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
        if (userData != null && userData.containsKey('name')) {
          userName.value = userData['name'];
        }
      }
    }
  }

  void logout() async {
    await _auth.signOut();
    isLoggedIn.value = false;
    Get.offAllNamed('/login');
  }
}
