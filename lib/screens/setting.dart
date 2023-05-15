import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/boxContainer.dart';
import '../widgets/pageDecoration.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

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
          'Settings',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'Account Setting',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:2,right: 60),
              child: BoxContainer(
                width: 440,
                text: 'Change password',
                iconLeft: Icon(Icons.lock),
                backgroundColor: Colors.transparent,
                textColor: Colors.black54,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: BoxContainer(
                width: 440,
                text: 'Notifications',
                iconLeft: Icon(Icons.notification_important),
                backgroundColor: Colors.transparent,
                textColor: Colors.black54,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:2,right: 60),
              child: BoxContainer(
                width: 440,
                text: 'Statistics',
                iconLeft: Icon(Icons.account_balance_wallet_outlined),
                backgroundColor: Colors.transparent,
                textColor: Colors.black54,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:2,right: 60),
              child: BoxContainer(
                width: 440,
                text: 'About us',
                iconLeft: Icon(Icons.account_box),
                backgroundColor: Colors.transparent,
                textColor: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
