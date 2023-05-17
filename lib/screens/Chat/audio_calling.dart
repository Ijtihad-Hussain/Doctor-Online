import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;

import '../../utils/utils.dart';

class AudioCalling extends StatelessWidget {
  final String callingId;
  const AudioCalling({Key? key, required this.callingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
          appID: Utils.appId,
          appSign: Utils.appSignin,
          userID: callingId,
          callID: callingId,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
            ..onOnlySelfInRoom = (context){
              Navigator.pop(context);
            },
          userName: 'Iju Bhai',
        )
    );
  }
}
