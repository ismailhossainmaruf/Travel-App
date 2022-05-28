import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
appBar: AppBar(
  title: Text('Auth user(Logged'+(user == null? 'out':'in')+')'),
),
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
    )
    );
  }
}
