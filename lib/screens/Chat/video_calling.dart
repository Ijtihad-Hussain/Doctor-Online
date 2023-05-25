import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../utils/utils.dart';

class VideoCalling extends StatelessWidget {
  final String callID;

  const VideoCalling({
    Key? key,
    required this.callID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('callID $callID, appId ${Utils.appId}, appSignin ${Utils.appSignin}');
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: 1926353592,
        appSign: '4c93c498263678d552ab499f01fc2ec8bff5ba181c9eeca5f657bcddc26d6837',
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