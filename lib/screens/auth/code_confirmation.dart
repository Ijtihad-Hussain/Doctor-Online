import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CodeConfirmation extends StatelessWidget {
  const CodeConfirmation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kLightBlue,
                Colors.white,
                Colors.white,
              ],
            )
        ),
        padding: const EdgeInsets.symmetric(vertical: 160, horizontal: 60),
        child: Column(
          children: [
            const Text('Enter 4 Digits Code',
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                  fontSize: 24
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SingleChildScrollView(
              child: Center(
                child: Row(
                  children: const [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 14),
                        child: SizedBox(
                            height: 64.0,
                            width: 56.0,
                            child: Card(
                                color: Color.fromRGBO(173, 179, 191, 0.7),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                  // child: TextEditorForPhoneVerify(this.codeOne)
                                )
                            )
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                        child: SizedBox(
                            height: 64.0,
                            width: 56.0,
                            child: Card(
                                color: Color.fromRGBO(173, 179, 191, 0.7),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                  // child: TextEditorForPhoneVerify(this.codeOne)
                                )
                            )
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                        child: SizedBox(
                            height: 64.0,
                            width: 56.0,
                            child: Card(
                                color: Color.fromRGBO(173, 179, 191, 0.7),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                  // child: TextEditorForPhoneVerify(this.codeOne)
                                )
                            )
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                        child: SizedBox(
                            height: 64.0,
                            width: 56.0,
                            child: Card(
                                color: Color.fromRGBO(173, 179, 191, 0.7),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                  // child: TextEditorForPhoneVerify(this.codeOne)
                                )
                            )
                        )
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kInGreen),
                  fixedSize: MaterialStatePropertyAll(Size(250,10)),
                ),
                onPressed: () {},
                child: const Text(
                  "Continue",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}