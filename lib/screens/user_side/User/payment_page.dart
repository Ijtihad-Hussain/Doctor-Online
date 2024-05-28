import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/custom_text_form_field.dart';

import '../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/page_decoration.dart';
import 'menu.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGBlue,
        // elevation: 1,
        title: const Center(child: Text('Doctor Online')),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        // decoration: PageDecoration.pageDecoration,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                      child: Text(
                    'Select Payment Method',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    onPressed: (){

                    },
                    childWidget: Image.asset('assets/images/visa.png'),
                    color: Colors.white,
                    textColor: Colors.blueGrey,
                    fontSize: 20,
                    buttonText: 'VISA',
                    height: 60,
                    width: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    onPressed: (){

                    },
                    childWidget: Image.asset('assets/images/bank.png'),
                    color: Colors.white,
                    textColor: Colors.blueGrey,
                    fontSize: 20,
                    buttonText: 'BANK TRANSFER',
                    height: 60,
                    width: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    onPressed: (){

                    },
                    childWidget: Image.asset('assets/images/easypasia.png'),
                    color: Colors.white,
                    textColor: Colors.blueGrey,
                    fontSize: 20,
                    buttonText: 'EASYPAISA',
                    height: 60,
                    width: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    onPressed: (){

                    },
                    childWidget: Image.asset('assets/images/jazzcash.png'),
                    color: Colors.white,
                    textColor: Colors.blueGrey,
                    fontSize: 20,
                    buttonText: 'JAZZCASH',
                    height: 60,
                    width: 400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
