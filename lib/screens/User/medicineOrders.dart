import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';

import '../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/pageDecoration.dart';

class MedicineOrders extends StatelessWidget {
  const MedicineOrders({Key? key}) : super(key: key);

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
          'Medicine Orders',
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
              CustomTextFormField(
                height: 60,
                width: 350,
                hintText: 'Search',
                prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: (){},),
                // suffixIcon: Icon(Icons.backspace),
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: kLightGreen,
                              radius: 40,
                              child: Icon(Icons.medical_services_outlined,
                                size: 30,
                                color: kInGreen,
                              ),
                            ),
                          ),
                          Text(
                            'Guide to medicine\n           order',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: kLightGreen,
                              radius: 40,
                              child: Icon(Icons.medical_services,
                                size: 30,
                                color: kInGreen,
                              ),
                            ),
                          ),
                          Text(
                            'Prescription related\n           issues',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: kLightGreen,
                              radius: 40,
                              child: Icon(Icons.shopping_bag,
                                size: 30,
                                color: kInGreen,
                              ),
                            ),
                          ),
                          Text(
                            'Order status',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: kLightGreen,
                              radius: 40,
                              child: Icon(Icons.shopping_bag_outlined,
                                size: 30,
                                color: kInGreen,
                              ),
                            ),
                          ),
                          Text(
                            'Order delivery',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: kLightGreen,
                              radius: 40,
                              child: Icon(Icons.payment_outlined,
                                size: 30,
                                color: kInGreen,
                              ),
                            ),
                          ),
                          Text(
                            'Payments & refunds',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: kLightGreen,
                              radius: 40,
                              child: Icon(Icons.assignment_return_outlined,
                                size: 30,
                                color: kInGreen,
                              ),
                            ),
                          ),
                          Text(
                            'Order returns',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}