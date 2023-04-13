// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gasolina x Álcool',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double valorGasolina = 0.0;
  double valorAlcool = 0.0;
  double resultado = 0.0;

  void calcular() {
    setState(() {
      resultado = valorAlcool / valorGasolina * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gasolina x Álcool'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://media.istockphoto.com/vectors/stream-of-gold-coins-pours-from-the-fuel-handle-pump-nozzle-with-hose-vector-id1251678227?k=20&m=1251678227&s=612x612&w=0&h=WueKOjZwKgOk0wRBcj9zhL7Bli9N4Vy3vs8NcDJHwBA=',
              height: 200,
              width: 200,
            ),
            
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Center (
                  child: Text('Valor da Gasolina')
                ),
              ),
              onChanged: (value) {
                setState(() {
                  valorGasolina = double.parse(value);
                });
              },
            ),
            
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Center (
                  child: Text('Valor do Álcool')
                ),
              ),
              onChanged: (value) {
                setState(() {
                  valorAlcool = double.parse(value);
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(resultado >= 70 ? 'Abastecer com Gasolina' : 'Abastecer com Álcool'),
          ],
        ),
      ),
    );
  }
}
