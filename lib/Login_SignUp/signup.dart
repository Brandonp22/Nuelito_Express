import 'package:nuelitoexpress/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  SignUpModel signUpModel = SignUpModel();
  GlobalKey<FormState> formkey = GlobalKey();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool save(){
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      return true;
    }
    return false;
}

void validateandsubmit(){
  if(save()){
        firebaseAuth.createUserWithEmailAndPassword(email: signUpModel.sEmail, password: signUpModel.sPassword);
  }
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
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
        child: Form(
          key: formkey,
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
                  FadeAnimation(1.3, Text("Registrate", style: TextStyle(color: Colors.white, fontSize: 40),)),
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
                                child: TextFormField(
                                  onSaved: (text)=> signUpModel.sEmail = text,

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
                                child:  TextFormField(
                                  onSaved: (text)=> signUpModel.sPassword = text,
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
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child:  TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Confirmar contraseña',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.orange))),
                                  obscureText: true,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child:  TextFormField(
                                  onSaved: (text)=> signUpModel.sNombre = text,
                                  decoration: InputDecoration(
                                      labelText: '¿Cómo te llamas?',
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
                                child:  TextFormField(
                                  onSaved: (text)=> signUpModel.sTelefono = text,
                                  decoration: InputDecoration(
                                      labelText: 'Número de teléfono',
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
                            ],
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
                              child: GestureDetector(
                                onTap: validateandsubmit,
                                child: Center(
                                  child: Text(
                                    'REGISTRARSE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ))),

                        SizedBox(height: 20.0),
                        FadeAnimation(1.9, Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child:
                              Center(
                                child: Text('Regresar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
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
      ),
    );
  }
}

class SignUpModel{
  String sEmail, sPassword, sNombre, sTelefono;

  SignUpModel({this.sEmail, this.sPassword, this.sNombre,
      this.sTelefono});
}
