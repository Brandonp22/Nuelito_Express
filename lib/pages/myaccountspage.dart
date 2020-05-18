import 'package:flutter/material.dart';
import 'package:nuelitoexpress/bloc.navigation_bloc/naviation_bloc.dart';

class MyAccountsPage extends StatelessWidget with NavigationStates {
@override
Widget build(BuildContext context) {

}
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 45),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Mi",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Text(
            "Cuenta",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 30,
            ),
          ),
        ],
      )
    ],
  );
}
