
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:tele_consult/screens/common/auth/sign_in.dart';
import 'package:tele_consult/screens/common/on_oardings/splash_screen.dart';
import 'package:tele_consult/screens/doctor_side/doctor_home.dart';
import 'package:tele_consult/screens/user_side/User/payment_whatsapp.dart';
import 'package:tele_consult/screens/user_side/chat/audio_calling.dart';
import 'package:tele_consult/screens/user_side/chat/audio_calling_page.dart';
import 'package:tele_consult/screens/user_side/chat/video_calling.dart';
import 'package:tele_consult/screens/user_side/chat/video_calling_page.dart';
import 'package:tele_consult/screens/user_side/doctor_related/doctor_details.dart';
import 'package:tele_consult/screens/user_side/home_screen.dart';
import 'package:tele_consult/screens/user_side/prescription_upload_page.dart';
import 'package:timezone/timezone.dart' as tz;

DateTime dateTime = DateTime.now();

tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(dateTime, tz.getLocation('your_timezone'));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    ScreenUtilInit(
      builder: (context, _) => const MyApp(),
      designSize: const Size(375, 812),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) =>
          GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/doctor-home',
            routes: {
              '/': (context) => SplashScreen(),
              '/home': (context) => HomeScreen(),
              '/doctor-details': (context) => DoctorDetails(),
              '/doctor-home': (context) => DoctorHome(),
              '/login': (context) => SignIn(),
              '/video_call': (context) => VideoCalling(callID: 'ij'),
              '/audio_call': (context) => AudioCalling(callingId:'IJH'),
              '/group_call_screen': (context) => VideoCallingPage(),
              '/audio_call_screen': (context) => AudioCallingScreen(),
              '/pup': (context) => PrescriptionUploadPage(),
              '/paymentWhatsapp': (context) =>  PaymentWhatsapp(title: 'IJTIHAD HUSSAIN',bankName: 'Habib Metropolitan Bank', bankAccountNo: '06-03-45-020311-714-000142657', iban: 'PK72MPBL027146142617', amountToPay: 500),
            },
          ),
    );
  }
}

