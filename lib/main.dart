import 'package:flutter/material.dart';

import './screens/signup.dart';
import './screens/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SignInScreen(),
      routes: {
        '/signUp': (context) => SignUpScreen(),
        '/signIn': (context) => SignInScreen(),
      },
    );
  }
}
