import 'dart:async';
import 'dart:io';

import 'package:day39/model/dra_wer.dart';
import 'package:day39/pages/uipagesinsideapp/secondui.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  bool loading = false;

  Future <void> muUploadImage (String inputSource)async{
    final picker = ImagePicker();
    final XFile? pickImage = await picker.pickImage(
        source: inputSource =='camera'
            ?ImageSource.camera
            :ImageSource.gallery);

    if (pickImage == null){
      return null;
    }
    String fileName = pickImage.name;
    File imageFile = File(pickImage.path);

    try{
      setState(() {
        loading = true;
      });
      await firebaseStorage.ref(fileName).putFile(imageFile);
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('image uploaded')));
    }
    on FirebaseException catch(e){
      print(e);
    }
  }

  Future<List> loadImage() async {
    List<Map> files = [];

    final ListResult result = await firebaseStorage.ref().listAll();

    final List<Reference> allFiles = result.items;

    await Future.forEach(allFiles, (Reference file) async {
      final String fileUrl = await file.getDownloadURL();
      files.add({"url": fileUrl, "path": file.fullPath});
    });

    print(files);
    return files;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerR(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        actions: [
          // Padding(padding: EdgeInsets.all(10)),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 25,
                    )),
                InkWell(
                  onTap: (() {
                    setState(() {

                    });
                  }),
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(32)
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white60,
                      backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        // flexibleSpace: Row(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        //     Container(
        //       height: 35,
        //       width: 35,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(50),
        //           color: Colors.black87),
        //       child: CircleAvatar(
        //         radius: 20,
        //         backgroundColor: Colors.white60,
        //       ),
        //     ),
        //   ],
        // ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin:  EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Daily",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black54
                    ),),
                    Text("Recommendation",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.black
                      ),),
                  ],
                ),
              ),
        Container(
          height: 150,
          margin: EdgeInsets.only(right: 15),
          child: FutureBuilder(
            future: loadImage(),
            builder: (context,AsyncSnapshot snaphot){
              if(snaphot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                  ),
                );
              }
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snaphot.data.length ??0,
                  itemBuilder: (context, index){
                    final Map image = snaphot.data[index];
                    return Container(
                      height: 150,
                      margin: EdgeInsets.only(right: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          Image.network(image['url'],
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                            width: 100,

                          ),
                          Positioned(
                            bottom: 15,
                            left: 3,
                            right: 3,
                            child: Container(
                              margin: EdgeInsets.all(5),

                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Color in Ui Design:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "A (Practical)",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Framework",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],

                      ),
                    );

                  });
            },
          ),

        ),
              Container(
                height: 20,
                color: Colors.white10,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: (() {
                        setState(() {

                        });
                      }),
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 45,
                          color: Colors.transparent,
                          child: Text(
                            "Top",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 30,
                          color: Colors.transparent,
                          child: Text(
                            "Popular",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                    InkWell(
                      onTap: (() {
                        setState(() {});
                      }),
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          color: Colors.transparent,
                          child: Text(
                            "Trending",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                    InkWell(
                      onTap: (() {
                        setState(() {});
                      }),
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          color: Colors.transparent,
                          child: Text(
                            "Editor",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                    InkWell(
                      onTap: (() {
                        setState(() {});
                      }),
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          color: Colors.transparent,
                          child: Text(
                            "Top",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          color: Colors.transparent,
                          child: Text(
                            "Popular",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                    InkWell(
                      onTap: (() {
                        setState(() {});
                      }),
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          color: Colors.transparent,
                          child: Text(
                            "Trending",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                    InkWell(
                      onTap: (() {
                        setState(() {});
                      }),
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          color: Colors.transparent,
                          child: Text(
                            "Editor",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                  ],
                ),
              ),
        Container(
          margin: EdgeInsets.only(top:10,left: 5),
          width: MediaQuery.of(context).size.width,
          height: 350,
          color: Colors.white,
          child: InkWell(
            onTap: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UiSecond()));
              });
            },
            child:FutureBuilder(
    future: loadImage(),
    builder: (context,AsyncSnapshot snaphot) {
        if (snaphot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snaphot.data.length ?? 0,
            itemBuilder: (context, index) {
              final Map image = snaphot.data[index];
              return Row(
                crossAxisAlignment:CrossAxisAlignment.center,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      //margin: EdgeInsets.only(top: 8),
                      height: 80,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(image['url'],
                            fit: BoxFit.cover,
                            height: 50,
                            width: 70,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.only(left: 5) ,
                      height: 80,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Inspiration for new\nProjects can be found"),
                          Container(
                            width:double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    setState(() {});
                                  }),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(32)
                                    ),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white60,
                                      backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png'),
                                    ),
                                  ),
                                ),
                                Text("Crishtiana"),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                        Icons.timer,
                                        size: 16
                                    )),
                                Text("1.00am"),
                              ],
                            ),

                          ),
                        ],
                      )
                  )
                ],
              );
            }
        );
    }),
          )),
              SizedBox(height: 10,),
              Text('Share your experience!',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black54
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(onPressed: (){
                    muUploadImage('camera');
                  }, icon: Icon(Icons.camera), label: Text('Camera')),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(onPressed: (){
                    muUploadImage('gallery');
                  }, icon: Icon(Icons.library_add), label: Text('Gallery'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
