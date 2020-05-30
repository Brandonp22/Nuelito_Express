import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nuelitoexpress/Animation/FadeAnimation.dart';
import 'package:nuelitoexpress/bloc.navigation_bloc/naviation_bloc.dart';

bool _enabled = false;
var visible = 1.0;
var invisible = 0.0;
var editBottom = visible;
var saveBottom = invisible;
class MyAccountsPage extends StatelessWidget with NavigationStates {
  final FirebaseUser user;
  MyAccountsPage({Key key, this.user}) : super(key: key);
  String sNombre, sTelefono;

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
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: '${snapshot.data['Email']}',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  enabled: _enabled,
                                  decoration: InputDecoration(
                                      hintText: '${snapshot.data['Nombre']}',
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
                                  validator: (value) => value.isEmpty ? '*Campo Obligatorio' : null,
                                  onSaved: (value)=> sNombre = value,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  enabled: _enabled,
                                  decoration: InputDecoration(
                                          hintText: '${snapshot.data['Telefono']}',
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
                                  validator: (value) => value.isEmpty ? '*Campo Obligatorio' : null,
                                  onSaved: (value)=> sTelefono = value,
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 50.0),
                        FadeAnimation(1.6,
                          Opacity(
                              opacity: editBottom,
                              child: Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(50.0),
                              shadowColor: Colors.orangeAccent,
                              color: Colors.orange[900],
                              elevation: 7.0,
                              child: InkWell(
                                onTap: () {
                                  _enabled = true;
                                  saveBottom = visible;
                                  editBottom = invisible;
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                                },
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
                            )))),

                        SizedBox(height: 25.0),
                        FadeAnimation(1.6,
                         Opacity(
                              opacity: saveBottom,
                              child: Container(
                                  height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(50.0),
                              shadowColor: Colors.orangeAccent,
                              color: Colors.orange[900],
                              elevation: 7.0,
                              child: InkWell(
                                onTap: () {
                                  _enabled = false;
                                  saveBottom = invisible;
                                  editBottom = visible;
                                  updateData();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                                },
                                child: Center(
                                  child: Text(
                                    'Guardar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )))),

                        SizedBox(height: 25.0),
                        FadeAnimation(1.6,
                         Opacity(
                           opacity: saveBottom,
                            child: Container(
                                height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(50.0),
                              shadowColor: Colors.orangeAccent,
                              color: Colors.orange[900],
                              elevation: 7.0,
                              child: InkWell(
                                onTap: () {
                                  _enabled = false;
                                  saveBottom = invisible;
                                  editBottom = visible;
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                                },
                                child: Center(
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )))),
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

  void updateData(){
    print("Hola");
    print(sNombre);
    try{
      final databaseReference = Firestore.instance;
      databaseReference.collection('Usuarios').document(user.uid)
          .updateData({
        'Nombre': sNombre,
        'Telefono': sTelefono
      });
      Fluttertoast.showToast(
          msg: "Datos editados correctamente.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch (e){
      print(e.message);
    }
  }
}
