import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Final',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      debugShowMaterialGrid: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String username = '';
  String password = '';

  void _singIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(
              width: 150,
              image: NetworkImage(
                  'https://pbs.twimg.com/profile_images/438771627854024704/Az4OY07a_400x400.png'),
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => username = value,
                decoration: const InputDecoration(label: Text("Email"))),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) => password = value,
                  decoration: const InputDecoration(label: Text("Senha"))),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: _singIn,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                      child: Text("Entrar")),
                ))
          ],
        ),
      ),
    );
  }
}
