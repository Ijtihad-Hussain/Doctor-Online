import 'package:flutter/material.dart';
import 'package:tele_consult/utils/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallingPage extends StatefulWidget {
  const VideoCallingPage({Key? key}) : super(key: key);

  @override
  State<VideoCallingPage> createState() => _VideoCallingPageState();
}

class _VideoCallingPageState extends State<VideoCallingPage> {
  final callIDTextCtrl = TextEditingController(text: "call_id");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIDTextCtrl,
                  decoration:
                  const InputDecoration(labelText: "join a call by id"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CallPage(callID: callIDTextCtrl.text);
                    }),
                  );
                },
                child: const Text("join"),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class CallPage extends StatelessWidget {
  final String callID;

  const CallPage({
    Key? key,
    required this.callID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: Utils.appId,
        appSign: Utils.appSignin,
        userID: callID,
        userName: "user_$callID",
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) {
            Navigator.of(context).pop();
          },
      ),
    );
  }
}