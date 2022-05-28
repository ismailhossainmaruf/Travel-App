import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiSecond extends StatefulWidget {
  const UiSecond({Key? key}) : super(key: key);

  @override
  State<UiSecond> createState() => _UiSecondState();
}

class _UiSecondState extends State<UiSecond> {
  int i=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://images.pexels.com/photos/1671325/pexels-photo-1671325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 150,
            left: 50,
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Color in Ui Design\n(Practical)\nFramwork",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            child: Stack(
              children: [
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.Color in Ui Design Practical Framwork.",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  i++;
                });
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.redAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.favorite,size: 25,),
                  Text("${i++}",style: TextStyle(
                    fontSize: 12
                  ),),
                ], ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
