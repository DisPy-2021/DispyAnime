import 'package:flutter/material.dart';
import 'package:flutter_app_murilo/UI/registro.dart';
import 'UI/home_page.dart';
import 'UI/input_field.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Material App
      debugShowCheckedModeBanner: false,
      title: "Dispy Anime Review",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //StateFullWidget

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(88, 101, 242, 1),
      //Scaffold
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(40, 42, 54, 1),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 400,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Dispy Anime Review Login',
                      style: TextStyle(
                          color: Color.fromRGBO(88, 101, 242, 1), fontSize: 28),
                    ),
                    Form(
                      child: InputField(
                          //Calling inputField  class
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          "Username"),
                    ),
                    Form(
                      child: InputField(
                          const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          "Password"),
                    ),
                    Container(
                      width: 150,
                      child: RaisedButton(
                        //Raised Button
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                        },
                        color: Color.fromRGBO(88, 101, 242, 1),
                        textColor: Colors.white,
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: RaisedButton(
                        //Raised Button
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Registro()));
                        },
                        color: Color.fromRGBO(88, 101, 242, 1),
                        textColor: Colors.white,
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
