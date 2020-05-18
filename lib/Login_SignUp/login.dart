import 'package:nuelitoexpress/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[800],
                  Colors.orange[600],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 35,),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(1, Image.asset('assets/logoNuelitoExpress.png', width: 180.0,))
                ],
              ),
            ),


            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1.3, Text("Iniciar sesión", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.6, Text("Bienvenido", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(38), topRight: Radius.circular(38))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        FadeAnimation(1.4, Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Correo Electrónico',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      // hintText: 'EMAIL',
                                      // hintStyle: ,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.orange))),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Contraseña',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.orange))),
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                        )),

                        SizedBox(height: 5.0),
                        FadeAnimation(1.5, Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            child: Text(
                              'Olvidé mi contraseña',
                              style: TextStyle(
                                  color: Colors.orange[900],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )),

                        SizedBox(height: 50.0),
                        FadeAnimation(1.6, Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(50.0),
                              shadowColor: Colors.orangeAccent,
                              color: Colors.orange[900],
                              elevation: 7.0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/sidebar_layout');
                                },
                                child: Center(
                                  child: Text(
                                    'INICIAR SESIÓN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ))),

                        SizedBox(height: 15.0),
                        FadeAnimation(1.8, Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '¿Eres nuevo?',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: Text(
                                'Registrate',
                                style: TextStyle(
                                    color: Colors.orange[900],
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}