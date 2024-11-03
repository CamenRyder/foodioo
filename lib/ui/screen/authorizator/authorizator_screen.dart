import 'package:flutter/material.dart';

class AuthorizatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthorizatorScreenState();
  }
}

class AuthorizatorScreenState extends State<AuthorizatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          
         ],
      ),
    ); 
  }
}
