import "package:flutter/material.dart";

class Imagemsol extends StatelessWidget {
  const Imagemsol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets\sol.png'),
      ),
    );
  }
}
