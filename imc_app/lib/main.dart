import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculadora de IMC"),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: const calculatorIMC(),
    );
  }
}

class calculatorIMC extends StatefulWidget {
  const calculatorIMC({super.key});
  @override
  State<calculatorIMC> createState() => _calculatorIMC();
}

class _calculatorIMC extends State<calculatorIMC> {
  double peso = 0.0, altura = 0.0;
  String resultado = "Informe seus dados!";
  String classificacao = '';
  void calcular() {
    double result = (peso / (altura * altura) * 10000);
    if (result < 18.5) {
      classificacao = "Abaixo do peso normal";
    } else if (result > 18.5 && result <= 24.9) {
      classificacao = "Peso normal";
    } else if (result >= 25 && result <= 29.9) {
      classificacao = "Execesso de peso";
    } else if (result >= 30 && result <= 34.9) {
      classificacao = "Obesidade classe 1";
    } else if (result >= 35 && result <= 39.9) {
      classificacao = "Obesidade classe 2";
    } else {
      classificacao = "Obesidade classe 3";
    }
    setState(() {
      resultado =
          "Seu resultado foi ${result.toStringAsFixed(2)}\nClassificação:$classificacao";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(
            "https://cdn-icons-png.flaticon.com/512/2815/2815428.png",
            height: 100,
            width: 100,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text("Peso(Kg)"),
              labelStyle: TextStyle(color: Colors.cyan, fontSize: 20),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => {peso = double.parse(value)},
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text(
                "Altura(cm)",
                style: TextStyle(color: Colors.cyan),
              ),
              labelStyle: TextStyle(color: Colors.cyan, fontSize: 20),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => {altura = double.parse(value)},
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: calcular,
                child: const Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Text(resultado),
        ],
      ),
    );
  }
}
