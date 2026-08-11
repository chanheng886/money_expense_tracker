import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreenDesktop extends StatefulWidget {
  const LoginScreenDesktop({super.key});

  @override
  State<LoginScreenDesktop> createState() => _LoginScreenDesktopState();
}

class _LoginScreenDesktopState extends State<LoginScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Login Screen Desktop")));
  }
}
