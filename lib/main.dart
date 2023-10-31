import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculadora de IMC",
    theme: ThemeData.dark(),
    home: const Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _textInfo = "";

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      //debugPrint("$imc");
      if (imc < 18.6) {
        _textInfo = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9)
        _textInfo = "Peso ideal (${imc.toStringAsPrecision(4)})";
      else if (imc >= 24.9 && imc < 29.9)
        _textInfo = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      else if (imc >= 29.9 && imc < 34.9)
        _textInfo = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      else if (imc >= 34.9 && imc < 39.9)
        _textInfo = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      else if (imc >= 40)
        _textInfo = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso (kg)",
                ),
              ),
              TextFormField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                ),
              ),
              ElevatedButton(
                onPressed: _calcular,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text("Calcular IMC"),
              ),
              Text(_textInfo, style: const TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}
