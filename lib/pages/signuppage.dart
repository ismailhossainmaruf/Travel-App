import 'package:day39/pages/firstpage.dart';
import 'package:day39/pages/registration.dart';
import 'package:day39/pages/uipagesinsideapp/homepage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  FirebaseAuth ?firebaseAuth;


 Future signUp()async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
          height:MediaQuery.of(context).size.height ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(16.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fill with your name",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white38
                      ),),
                  ],
                ),
              ),
              Container(
                //  width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    hintText: 'Enter your name',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 213, 97, 88),
                      ),
                    ),
                    labelText: "Enter your name ",
                    fillColor: Colors.transparent,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.redAccent),
                    labelStyle: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter your email",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white38
                      ),),
                  ],
                ),
              ),
              Container(
                //  width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Enter your email',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 213, 97, 88),
                      ),
                    ),
                    labelText: "Enter your email ",
                    fillColor: Colors.transparent,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.redAccent),
                    labelStyle: TextStyle(color: Colors.redAccent),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("password here",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white38
                      ),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_outlined),
                    hintText: 'Enter your password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 213, 97, 88),
                      ),
                    ),
                    labelText: "Enter your Password ",
                    fillColor: Colors.transparent,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.purple),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Confirm password",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white38
                      ),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_outlined),
                    hintText: 'Confirm your password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 213, 97, 88),
                      ),
                    ),
                    labelText: "Confirm your Password ",
                    fillColor: Colors.transparent,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.purple),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    signUp();

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        RegistrationForm()));

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
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),)
                    ],
                  ),
                ),
              ),
              // Container(
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       ElevatedButton(onPressed: (){}, child: Text('Sign In')),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
