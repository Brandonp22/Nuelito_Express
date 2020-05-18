import 'package:flutter/material.dart';
import 'Login_SignUp/login.dart';
import 'Login_SignUp/signup.dart';

import 'sidebar/sidebar_layout.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/sidebar_layout': (BuildContext context) => new SideBarLayout()
      },
      home: LoginPage(),
    )
);
