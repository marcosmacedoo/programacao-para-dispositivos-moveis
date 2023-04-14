import "package:flutter/material.dart";

class InitialUmbrella extends StatefulWidget {
  const InitialUmbrella({super.key});
  @override
  State<InitialUmbrella> createState() => _InitialUmbrella();
}

class _InitialUmbrella extends State<InitialUmbrella> {
  double valorGasolina = 0.0;
  double valorEtanol = 0.0;
  String valorCalculado = "";

  void _calculaMelhorOpcao() {
    double resultado = valorEtanol / valorGasolina * 100;
    if (resultado >= 70) {
      setState(() {
        valorCalculado = "Resultado: $resultado, \nMelhor abastecer com alcool";
      });
    } else {
      setState(() {
        valorCalculado =
            "Resultado: $resultado, \nMelhor abastecer com gasolina";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(children: [
        TextField(
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(label: Text("Valor da gasolina")),
          onChanged: (text) {
            valorGasolina = double.parse(text);
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(label: Text("Valor do alcool")),
          onChanged: (text) {
            valorEtanol = double.parse(text);
          },
        ),
        ElevatedButton(
            onPressed: _calculaMelhorOpcao, child: const Text("Calcular")),
        Text(valorCalculado),
      ]),
    ));
  }
}
