import 'package:day39/pages/signinpage.dart';
import 'package:day39/pages/signuppage.dart';
import 'package:flutter/material.dart';

class FirstPageScreen extends StatefulWidget {
  const FirstPageScreen({Key? key}) : super(key: key);

  @override
  State<FirstPageScreen> createState() => _FirstPageScreenState();
}

class _FirstPageScreenState extends State<FirstPageScreen> {
  Future <void> welcomeMsg (String inputSource)async{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Welcome',
    style: TextStyle(
      color: Colors.redAccent
    ),)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network('https://images.pexels.com/photos/2770933/pexels-photo-2770933.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,),
          Positioned(
            top: 100,
            left: 40,
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Everyday New",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    "Travel Vlog",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                    SignIn()));
                  });
                },
                hoverColor:Colors.blueGrey ,
                child: Container(
                  margin: EdgeInsets.all(17.0),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SIGN IN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),)
                    ],
                  ),
                ),
              ),
             Column(mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text("Or",
                   style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w600,
                       color: Colors.white
                   ),),
               ],
             ),
              InkWell(
                onTap: (){
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        SignUp()));
                  });
                },
                hoverColor:Colors.blueGrey ,
                child: Container(
                  margin: EdgeInsets.all(17.0),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff1E5DE0),
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SIGN UP',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
