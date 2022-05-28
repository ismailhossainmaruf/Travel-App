import 'package:day39/pages/signinpage.dart';
import 'package:day39/pages/uipagesinsideapp/about.dart';
import 'package:day39/pages/uipagesinsideapp/homepage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DrawerR extends StatefulWidget {
  const DrawerR({Key? key}) : super(key: key);

  @override
  State<DrawerR> createState() => _DrawerRState();
}

class _DrawerRState extends State<DrawerR> {

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.transparent,
    appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(''),
                  accountEmail: Text('+user!.email!'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 25,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png"),
                    child: CircleAvatar(
                        radius: 5,
                        child: Positioned(
                            bottom: 20,
                            left: 10,
                            child: IconButton(
                                onPressed: (() {}), icon: Icon(Icons.camera)))),
                  ),
                ),
                Divider(
                  color: Colors.red,
                  thickness: 5,
                  indent: 10,
                  endIndent: 5,
                ),
                ListTile(
                  tileColor: Colors.black54,
                  trailing: Icon(Icons.home_filled),
                  title: Text("Home",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage2()));
                  },
                ),
                ListTile(
                  tileColor: Colors.black54,
                  trailing: Icon(Icons.login),
                  title: Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                   setState(() {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => SignIn()));
                   });
                  },
                ),
                ListTile(
                  tileColor: Colors.black54,
                  trailing: Icon(Icons.info),
                  title: Text("About",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                   setState(() {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => AboutUs()));
                   });
                  },
                ),
                ListTile(
                  tileColor: Colors.black54,
                  trailing: Icon(Icons.info),
                  title: Text("Sign out",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    setState(() {
                    });
                  },
                ),
              ],
            ),

          ],
        ),

      ),
      drawerDragStartBehavior: DragStartBehavior.start,
    );
  }
}
