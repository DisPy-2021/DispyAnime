import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_murilo/Controllers/review_controller.dart';
import 'package:flutter_app_murilo/NetWorks/network.dart';
import 'package:flutter_app_murilo/animelist/user_list.dart';
import 'package:http/http.dart';

import 'input_field.dart';

class ReviewPage extends StatefulWidget {
  final String nome;
  User ferd;
  ReviewPage({required this.nome, required this.ferd});
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final reviewText = TextEditingController();
  final network = Network('http://localhost:8080');
  var list_of_reviews = [];
  @override
  void initState() {
    super.initState();
    update_UI();
  }

  void update_UI() async {
    list_of_reviews = await network.getData('/anime/${widget.nome}/reviews');
    print(list_of_reviews);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 42, 54, 1),
      appBar: AppBar(
        title: Center(child: Text('Dispy ${widget.nome} Review')),
        backgroundColor: Color.fromRGBO(88, 101, 242, 1),
      ),
      body: Center(
        child: Column(children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: list_of_reviews.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(
                            left: 5, top: 5, right: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(88, 101, 242, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 5,
                          //     blurRadius: 7,
                          //     offset: Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                "${list_of_reviews[index]["profile_photo"]}",
                                height: 75.0,
                                width: 75.0,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${list_of_reviews[index]["nickName"]}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        "${list_of_reviews[index]["reviewText"].toString()}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Form(
            child: TextField(
              controller: reviewText,
              style: TextStyle(color: Colors.white),
            ),
            // onChanged: (value) {
            //   reviewText  =value;
            //   setState(() {
            //   });
            // },
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 150,
            child: RaisedButton(
              onPressed: () async {
                var postBody = Review(
                  review_id: 0,
                  dislikes: 0,
                  nick_name: widget.ferd.nickName,
                  grade: 90,
                  anime_title: widget.nome,
                  likes: 0,
                  review_text: reviewText.text.toString(),
                ).toJson();

                var sla = await network.postData(
                    '/anime/${widget.nome}/reviews/new', postBody);
                print(postBody);
                setState(() {
                  update_UI();
                });
              },
              color: Color.fromRGBO(88, 101, 242, 1),
              textColor: Colors.white,
              child: const Text(
                "Send Review",
                style: TextStyle(fontSize: 20.0),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
