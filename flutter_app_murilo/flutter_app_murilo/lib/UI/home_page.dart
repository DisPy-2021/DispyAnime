import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_murilo/NetWorks/network.dart';
import 'package:flutter_app_murilo/UI/perfil_screen.dart';
import 'package:flutter_app_murilo/UI/review.dart';
import 'package:flutter_app_murilo/animelist/anime_list.dart';
import 'package:flutter_app_murilo/animelist/user_list.dart';

class MyHomePage extends StatefulWidget {
  //StatelessWidget
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final network = Network('http://localhost:8080');
  var list_of_animes = [];
  var list_of_review = [];
  @override
  void initState() {
    super.initState();
    update_UI();
  }

  dynamic from_json(Map<String, dynamic> map) {
    return Anime(
      title: map['title'],
      description: map['description'],
      score: map['score'],
      cover_photo: map['cover_photo'],
      genre: map['genre'],
      review: map['review'],
    );
  }

  void update_UI() async {
    list_of_animes = await network.getData('/anime');
    list_of_review = await network.getData('/anime/Ishuzoku Reviewers/reviews');
    print(list_of_review);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    User ferd = User(
        'ferd',
        'ferdmax',
        'zeusian90@gmail.com',
        '21331312dsd',
        0000,
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png',
        ['Bokunopiuc', 'lixo'],
        ['algo', 'inazuma', 'ferreira']);
    // List<Anime> list_of_animes = [
    //   Anime(
    //     title: "Pikachu",
    //     cover_photo:
    //         "https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png",
    //     genre: "Elétrico",
    //     description: 'Um dos melhores list_of_animes do mundo',
    //     score: 0,
    //     review: ['muito bom', 'ruim'],
    //   ),
    //   Anime(
    //       title: "Sandchurew",
    //       cover_photo:
    //           "https://wikidobragens.fandom.com/pt/wiki/Inazuma_Eleven?file=Inazuma_eleven.jpg",
    //       genre: "Terrestre",
    //       description: "Este aqui era muito bom no passado",
    //       score: 84,
    //       review: ['muito bom', 'ruim']),
    // ];
    return Scaffold(
      // backgroundColor: Color.fromRGBO(159, 168, 218, 1),
      backgroundColor: Color.fromRGBO(40, 42, 54, 1),
      //Home Page Scaffold
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(88, 101, 242, 1),
        title: const Text("Dispy Review Anime"),
        centerTitle: true,
        actions: <Widget>[
          Text('#${ferd.userDataId}'),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              try {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PerfilScreen(
                        watchList: ferd.watchList,
                        fineshedAnimes: ferd.finishedAnimes)));
              } on Exception catch (e, s) {
                print(s);
              }
            },
          )
        ],
      ),
      // body: Scaffold(),
      body: ListView.builder(
        itemCount: list_of_animes.length,
        itemBuilder: (context, itemIndex) {
          return Center(
            child: Container(
              margin:
                  EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
              height: 600.0,
              width: 300.0,
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
              child: Column(
                children: [
                  new Image.network(
                    '${list_of_animes[itemIndex]['coverPhoto'].toString()}',
                    width: 150.0,
                    height: 200.0,
                  ),
                  Text(
                    "${list_of_animes[itemIndex]['title']}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text("____________________________________"),
                  SizedBox(
                    height: 10,
                  ),
                  Chip(
                    labelPadding: EdgeInsets.all(4),
                    label: Text('${list_of_animes[itemIndex]['genre']}'),
                    backgroundColor: Colors.white,
                  ),
                  Text("____________________________________"),
                  Flexible(
                      child: Text(
                    "${list_of_animes[itemIndex]['description']}",
                    style: TextStyle(color: Colors.white),
                  )),
                  Text("____________________________________"),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   'SCORE: ${list_of_animes[itemIndex].score}',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Text(
                  //   (() {
                  //     if (list_of_animes[itemIndex].score > 80) {
                  //       return "${list_of_animes[itemIndex].score}";
                  //     }
                  //     style:
                  //     TextStyle(color: Colors.green);
                  //     return "${list_of_animes[itemIndex].score}";
                  //   })(),
                  //   style: TextStyle(color: Colors.red),
                  // ),
                  // list_of_animes[itemIndex].score >= 80
                  //     ? Text(
                  //         'SCORE: ${list_of_animes[itemIndex].score}',
                  //         style: TextStyle(
                  //             color: Colors.green,
                  //             backgroundColor: Colors.white),
                  //       )
                  //     : Text(
                  //         'SCORE: ${list_of_animes[itemIndex].score}',
                  //         style: TextStyle(color: Colors.red),
                  //       ),

                  RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        new TextSpan(text: 'Score '),
                        if (double.parse(list_of_animes[itemIndex]['score']) >=
                            80)
                          TextSpan(
                            text: '${list_of_animes[itemIndex]['score']}',
                            style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.green,
                            ),
                          )
                        else
                          TextSpan(
                            text: '${list_of_animes[itemIndex]['score']}',
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.red),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      print(list_of_animes[itemIndex]['title']);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReviewPage(
                                nome: list_of_animes[itemIndex]['title'],
                                ferd: ferd,
                              )));
                    },
                    child: Container(
                      width: 100,
                      height: 25,
                      // color: Colors.black,
                      child: Center(
                        child: Text(
                          'Review',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      ferd.watchList.add(list_of_animes[itemIndex]['title']);
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      // color: Colors.black,
                      child: Center(
                        child: Text(
                          'Add to Watch list',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      ferd.finishedAnimes
                          .add(list_of_animes[itemIndex]['title']);
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      // color: Colors.black,
                      child: Center(
                        child: Text(
                          'Add to Finished list',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                    ),
                  ),
                ],
              ),
            ),
          );
          // return ListTile(
          //   title: Text("${list_of_animes[itemIndex].nome}"),
          //   leading: Image.network("${list_of_animes[itemIndex].urlPhoto}"),
          //   subtitle: Text("${list_of_animes[itemIndex].description}"),
          // );
        },
      ),
    );
  }
}
