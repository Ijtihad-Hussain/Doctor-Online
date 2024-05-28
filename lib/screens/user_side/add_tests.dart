import 'package:flutter/material.dart';
import 'package:tele_consult/screens/user_side/diagnostic_tests.dart';

import '../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/page_decoration.dart';

class AddTests extends StatelessWidget {
  const AddTests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black38,
        ),
        title: const Text(
          'Add test',
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: kLightGreen,
                  radius: 100,
                  child: Icon(Icons.add_comment,
                    size: 100,
                    color: kInGreen,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  width: 160,
                  buttonText: 'Add Tests',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DiagnosticTests()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
