import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class DoctorLiveChat extends StatelessWidget {
  const DoctorLiveChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.black
              ],
            )
        ),
        child: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.black
                  ],
                )
            ),
            child: Image.asset(
                    'assets/images/doctorlive.png',
                    scale: .5,
                color: const Color.fromRGBO(255, 255, 255, 0.5),
                colorBlendMode: BlendMode.modulate
                  ),
          ),
          Align(alignment: Alignment.bottomCenter,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kDarkGreen,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
                hintText: "Add a comment",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.message_outlined),
                ),
              ),
            ),
          )
        ],
        ),
      ),
    );
  }
}
