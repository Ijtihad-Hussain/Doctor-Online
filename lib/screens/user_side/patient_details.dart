import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/custom_text_form_field.dart';

import '../../widgets/button.dart';
import '../../widgets/page_decoration.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({Key? key}) : super(key: key);

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
          'Patient Details',
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
             Container(
               height: 440,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Column(
                 children: [
                   const Padding(
                     padding: EdgeInsets.only(top: 12),
                     child: Text(
                       'Patient Name',
                       style: TextStyle(
                         fontWeight: FontWeight.bold
                       ),
                     ),
                   ),
                   CustomTextFormField(
                     width: 320,
                     hintText: 'Name',
                     color: Colors.grey,
                     isTextAlignCenter: true,
                   ),
                   const Padding(
                     padding: EdgeInsets.only(top: 12),
                     child: Text(
                       'Mobile Number',
                       style: TextStyle(
                           fontWeight: FontWeight.bold
                       ),
                     ),
                   ),
                   CustomTextFormField(
                     width: 320,
                     hintText: '+17281787237',
                     color: Colors.grey,
                     isTextAlignCenter: true,
                   ),
                   const Padding(
                     padding: EdgeInsets.only(top: 12),
                     child: Text(
                       'Email',
                       style: TextStyle(
                           fontWeight: FontWeight.bold
                       ),
                     ),
                   ),
                   CustomTextFormField(
                     width: 320,
                     hintText: 'email@email.com',
                     color: Colors.grey,
                     isTextAlignCenter: true,
                   ),
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Button(
                 onPressed: (){

                 },
                 width: 200,
                 buttonText: 'Continue',
               ),
             ),
           ],
         ),
       ),
     ),
    );
  }
}
