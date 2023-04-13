import "package:flutter/material.dart";

class Imagenuvem extends StatelessWidget {
  const Imagenuvem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets\nuvem.png'),
      ),
    );
  }
}
