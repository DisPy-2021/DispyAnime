import 'package:flutter/material.dart';
import '../main.dart';
import 'input_field.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  //StatelessWidget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Criar conta',
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
                            Icons.person,
                            color: Colors.white,
                          ),
                          "NickName"),
                    ),
                    Form(
                      child: InputField(
                          const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          "Password"),
                    ),
                    Form(
                      child: InputField(
                          const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          "Email"),
                    ),
                    Form(
                      child: InputField(
                          const Icon(
                            Icons.photo,
                            color: Colors.white,
                          ),
                          "Picture(URL Link)"),
                    ),
                    Container(
                      width: 150,
                      child: RaisedButton(
                        //Raised Button
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        },
                        color: Color.fromRGBO(88, 101, 242, 1),
                        textColor: Colors.white,
                        child: Center(
                          child: const Text(
                            "Create account",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
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
