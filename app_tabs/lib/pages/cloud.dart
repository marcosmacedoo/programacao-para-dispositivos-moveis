import 'package:flutter/material.dart';

class InitialCloud extends StatefulWidget {
  const InitialCloud({super.key});
  @override
  State<InitialCloud> createState() => _InitialCloudWidget();
}

class _InitialCloudWidget extends State<InitialCloud> {
  final List<String> selecionados = <String>['Tiago', 'Vamos', 'Luis'];
  final List<bool> values = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: selecionados.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              tileColor: Colors.white,
              title: Text('Usuário ${selecionados[index]}'),
              value: values[index],
              onChanged: (bool? value) {
                setState(() {
                  values[index] = value!;
                });
              },
            );
          }),
    );
  }
}
