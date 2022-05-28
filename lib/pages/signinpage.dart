import 'package:day39/pages/signuppage.dart';
import 'package:day39/pages/uipagesinsideapp/homepage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FirebaseAuth? firebaseAuth;

  Future signIn()async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('Sign In'),
        elevation: 0,
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

        height:MediaQuery.of(context).size.height ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("user id",
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
                // validator: (value) {
                //   if (!value!.contains("@")) {
                //     return "Invalid Email Address";
                //   }
                //   else if(value!=null){
                //     return "enter email id ";
                //   }
                // },
                // validator: (value){
                //   if (value!=null){
                //     return "invalid email";
                //   }
                // },
                // // validator:signIn(),
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
                obscureText: true,
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
                // validator: (value){
                //   if (value!=null){
                //     return "invalid password";
                //   }
                // },
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Enter your password";
                //   }
                //   if (value.length > 8) {
                //     return "Password is too long";
                //   }
                //   if (value.length < 8) {
                //     return "Password is too short";
                //   }
                //   if (value!=null){
                //     return "Please enter your password";
                //   }
                // },
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                    {

                    }
                    //  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                    setState(() {
                      // _isObsecure = !_isObsecure;
                      signIn();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                          HomePage2(
                          )));
                    });
                  }, child: Text('Sign In')),
                  TextButton(onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          SignUp()));
                    });
                  }, child: Text("don't have any account?"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
