import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  const AuthBackground({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: child,
        ),
      ),
    );
  }
}
