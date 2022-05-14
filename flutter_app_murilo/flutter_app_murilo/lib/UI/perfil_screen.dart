import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  final List watchList;
  final List fineshedAnimes;

  PerfilScreen({required this.watchList, required this.fineshedAnimes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 42, 54, 1),
      appBar: AppBar(
        title: const Text("Dispy Review Anime"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(88, 101, 242, 1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SizedBox(
              //   width: 100,
              // ),
              SizedBox(
                height: 50,
              ),
              Text('WathcList',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Container(
                width: 400,
                height: 600,
                child: ListView.builder(
                    itemCount: watchList.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Flexible(
                        child: Container(
                            width: 100,
                            height: 25,
                            margin: EdgeInsets.only(
                                left: 5, top: 5, right: 5, bottom: 5),
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
                              //     offset:
                              //         Offset(0, 3), // changes position of shadow
                              //   ),
                              // ],
                            ),
                            // child: Row(
                            //   children: [
                            //     ClipRRect(
                            //       borderRadius: BorderRadius.circular(8.0),
                            //       child: Image.network(
                            //         fineshedAnimes[index],
                            //         height: 75.0,
                            //         width: 75.0,
                            //       ),
                            //     ),
                            child: Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(watchList[index]),
                                    // Text(watchList[index])
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
                margin:
                    EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
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
              ),
              SizedBox(
                width: 400,
              ),
              SizedBox(
                height: 50,
              ),
              Text('FineshedList',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Container(
                width: 400,
                height: 600,
                child: ListView.builder(
                    itemCount: fineshedAnimes.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Expanded(
                        child: Container(
                            width: 100,
                            height: 25,
                            margin: EdgeInsets.only(
                                left: 5, top: 5, right: 5, bottom: 5),
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
                              //     offset:
                              //         Offset(0, 3), // changes position of shadow
                              //   ),
                              // ],
                            ),
                            // child: Row(
                            //   children: [
                            //     ClipRRect(
                            //       borderRadius: BorderRadius.circular(8.0),
                            //       child: Image.network(
                            //         fineshedAnimes[index],
                            //         height: 75.0,
                            //         width: 75.0,
                            //       ),
                            //     ),
                            child: Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(fineshedAnimes[index]),
                                    // Text(watchList[index])
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
                margin:
                    EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
