import "package:flutter/material.dart";

class InitialSettings extends StatefulWidget {
  const InitialSettings({super.key});
  @override
  State<InitialSettings> createState() => _InitialSettings();
}

class _InitialSettings extends State<InitialSettings> {
  double peso = 0.0, altura = 0.0;
  String resultado = "Informe seus dados!";

  void calcular() {
    double result = (peso / (altura * altura) * 10000);
    setState(() {
      resultado = "Seu resultado foi ${result.toStringAsFixed(2)}";
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
              labelStyle: TextStyle(color: Colors.green, fontSize: 20),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => {peso = double.parse(value)},
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text(
                "Altura(cm)",
                style: TextStyle(color: Colors.green),
              ),
              labelStyle: TextStyle(color: Colors.green, fontSize: 20),
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
                // ignore: prefer_const_constructors
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
