import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day39/pages/uipagesinsideapp/homepage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  TextEditingController _contactnoController = TextEditingController();

  FirebaseAuth? firebaseAuth;

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

  register(){
    FirebaseFirestore.instance.collection('user-info').add({
      'name of user': _firstnameController.text,
      'last name of user':_lastnameController.text,
      'email': _emailController.text,
      'confirm password': _passwordController.text,
      'address': _addressController.text,
      'date of birth': _birthController.text,
      'contact no': _contactnoController.text,
    }).then((value){
      if(value!=null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            HomePage2()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body:  SingleChildScrollView(
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
      // height:MediaQuery.of(context).size.height ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Registration Form",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),),
              ],
            ),
          ),
          Container(
            //  width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _firstnameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.drive_file_rename_outline),
                hintText: 'First name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 213, 97, 88),
                  ),
                ),
                labelText: "First name ",
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(color: Colors.redAccent),
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Last name",
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
              controller: _lastnameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.edit),
                hintText: 'Last name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 213, 97, 88),
                  ),
                ),
                labelText: "Last name ",
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(color: Colors.redAccent),
                labelStyle: TextStyle(color: Colors.black87),

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
            margin: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
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
                labelStyle: TextStyle(color: Colors.black87),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Address",
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
              controller: _addressController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_pin),
                hintText: 'Your address here',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 213, 97, 88),
                  ),
                ),
                labelText: "Your address here ",
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(color: Colors.redAccent),
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date of birth",
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
              controller: _birthController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.date_range),
                hintText: 'Date of birth',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 213, 97, 88),
                  ),
                ),
                labelText: "Date of birth ",
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(color: Colors.redAccent),
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Phone No:",
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
              controller: _contactnoController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.numbers),
                hintText: 'Your phone number',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 213, 97, 88),
                  ),
                ),
                labelText: "Your phone number ",
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(color: Colors.redAccent),
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
              controller: _passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password_outlined),
                hintText: 'confirm password',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 213, 97, 88),
                  ),
                ),
                labelText: "confirm password ",
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(color: Colors.redAccent),
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                signUp();
                register();

                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                    HomePage2()));

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
