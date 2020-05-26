import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData extends StatelessWidget {
  const UserData({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('Usuarios')
            .document(user.uid)
            .snapshots(),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      return ListTile(
        title: Text(
          '${snapshot.data['Nombre']}',
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
        ),
        subtitle: Text(
          "${user.email}",
          style: TextStyle(
            color: Color.fromRGBO(255,224,130 ,1),
            fontSize: 15,
          ),
        ),
        leading: CircleAvatar(
          child: Icon(
            Icons.perm_identity,
            color: Colors.white,
          ),
          radius: 40,
          backgroundColor: Color.fromRGBO(255,224,130 ,1),
        ),
      );
    },
      ),
    );
  }
}
