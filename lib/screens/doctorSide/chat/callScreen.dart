import 'package:flutter/material.dart';

enum CallType {
  video,
  audio,
}

class CallScreen extends StatelessWidget {
  final CallType callType;

  CallScreen({required this.callType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(callType == CallType.video ? 'Video Call' : 'Audio Call'),
      ),
      body: Center(
        child: Text(callType == CallType.video ? 'Video Call Screen' : 'Audio Call Screen'),
      ),
    );
  }
}