import 'dart:async';

import 'package:day39/pages/firstpage.dart';
import 'package:day39/pages/signinpage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    Timer(Duration(
      seconds: 2
    ), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>

        FirstPageScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff360033),
                Color(0xff0b8793),
                Color(0xff373B44),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topCenter
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               // FlutterLogo(
               //   duration: Duration(
               //       seconds: 4
               //   ),
               //   size: 200,
               //   style:FlutterLogoStyle.stacked,
               //   textColor: Colors.white60,
               // ),
               // Image.network('https://www.onblastblog.com/wp-content/uploads/2017/08/blogger-logo-624x357.jpg',
               // )
               // Image.network("https://w1.pngwing.com/pngs/541/604/png-transparent-travel-world-map-drawing-black-and-white-circle-logo-globe-thumbnail.png",
               // height: 200,
               // width: 200,
               // )
               Image.asset("asset/logo.png",
                 height: 200,
                 width: 200,),
             ],
           ),
            SizedBox(height: 10,),
            Text("Arround The World!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white38
            ),),
            SizedBox(height: 50,),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
