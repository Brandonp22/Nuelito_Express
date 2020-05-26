import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nuelitoexpress/Animation/FadeAnimation.dart';
import 'package:nuelitoexpress/bloc.navigation_bloc/naviation_bloc.dart';

class MyAccountsPage extends StatelessWidget with NavigationStates {
  final FirebaseUser user;
  const MyAccountsPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('Usuarios')
            .document(user.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
            padding: EdgeInsets.fromLTRB(70, 40, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Mi",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      "Cuenta",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 35,
                      ),
                    ),
                  ],
                )
              ],
            ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                      FadeAnimation(1.4, CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            size: 40,
                            color: Colors.white,
                          ),
                          radius: 40,
                          backgroundColor: Colors.orange[900],
                        ),),

                        SizedBox(height: 20,),
                        FadeAnimation(1.4, Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Nombre',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                          hintText: '${snapshot.data['Nombre']}',
                                      // hintStyle: ,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Correo Electrónico',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                          hintText: '${snapshot.data['Email']}',
                                      // hintStyle: ,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Número de teléfono',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                          hintText: '${snapshot.data['Telefono']}',
                                      // hintStyle: ,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
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
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'Editar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ))),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
    ),
    );
  }
}
