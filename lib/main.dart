import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';
import 'package:tele_consult/screens/Chat/audio_calling.dart';
import 'package:tele_consult/screens/Chat/audio_calling_page.dart';
import 'package:tele_consult/screens/Chat/video_calling_page.dart';
import 'package:tele_consult/screens/Chat/messagingScreen.dart';
import 'package:tele_consult/screens/Chat/testMessagingScreen.dart';
import 'package:tele_consult/screens/Chat/video_calling.dart';
import 'package:tele_consult/screens/OnBoardings/splash_screen.dart';
import 'package:tele_consult/screens/User/paymentWhatsapp.dart';
import 'package:tele_consult/screens/aboutDoctor/doctorDetails.dart';
import 'package:tele_consult/screens/auth/sign_in.dart';
import 'package:tele_consult/screens/doctorSide/doctorHome.dart';
import 'package:tele_consult/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tele_consult/screens/prescriptionUploadPage.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// Assuming you have a DateTime object named 'dateTime'
DateTime dateTime = DateTime.now();

// Convert DateTime to TZDateTime
tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(dateTime, tz.getLocation('your_timezone'));


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    ScreenUtilInit(
      builder: (context, _) => ProviderScope(
        child: const MyApp(),
      ),
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
          MaterialApp(
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
              // '/test_message': (context) => TestMessagingScreen(),
              '/group_call_screen': (context) => VideoCallingPage(),
              '/audio_call_screen': (context) => AudioCallingScreen(),
              '/pup': (context) => PrescriptionUploadPage(),
              '/paymentWhatsapp': (context) =>  PaymentWhatsapp(title: 'IJTIHAD HUSSAIN',bankName: 'Habib Metropolitan Bank', bankAccountNo: '06-03-45-020311-714-000142657', iban: 'PK72MPBL0279527146142617', amountToPay: 500),
            },
          ),
    );
  }
}

