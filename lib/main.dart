import 'package:day39/pages/firstpage.dart';
import 'package:day39/pages/registration.dart';
import 'package:day39/pages/signinpage.dart';
import 'package:day39/pages/signuppage.dart';
import 'package:day39/pages/uipagesinsideapp/homepage2.dart';
import 'package:day39/screen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

void main()async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: SplashScreen(),
     // home: FirstPageScreen(),
    );
  }
}
