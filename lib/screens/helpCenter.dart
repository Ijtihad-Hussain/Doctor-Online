import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('How do I create an account?'),
              onTap: () {
                // Show answer or navigate to detailed FAQ page
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('How can I reset my password?'),
              onTap: () {
                // Show answer or navigate to detailed FAQ page
              },
            ),
            Divider(),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('ijtihadhussain@gmail.com'),
              onTap: () {
                // Open email composer with pre-filled support email
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('048392940293'),
              onTap: () {
                // Make a phone call to support hotline
              },
            ),
          ],
        ),
      ),
    );
  }
}
