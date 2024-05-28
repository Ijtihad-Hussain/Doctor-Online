
import 'package:flutter/material.dart';

import '../../controllers/user_side/diagnostic_tests_controller.dart';
import '../../widgets/lab_test_card.dart';
import '../../widgets/page_decoration.dart';

import 'package:get/get.dart';

class DiagnosticTests extends StatelessWidget {
  final DiagnosticTestsController controller = Get.put(DiagnosticTestsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: const Icon(
        //   Icons.arrow_back,
        //   color: Colors.black38,
        // ),
        title: const Text(
          'Book Lab Test',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildLabTestCard(
                onPressed: () {
                  controller.navigateToLabTestsScreen();
                },
              ),
              _buildLabTestCard(
                text1: 'Ghazi Lab',
                image: Image.asset('assets/images/lab2.jpg'),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabTestCard({VoidCallback? onPressed, String? text1, Image? image}) {
    return LabTestCard(
      onPressed: onPressed,
      text1: text1,
      image: image,
    );
  }
}

