import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int contactId = 0;
  String username = "";
  String password = "";

  _openDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'database.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String sql =
            'CREATE TABLE contacts (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR)';
        await db.execute(sql);
      },
    );
    return db;
  }

  _save() async {
    Database db = await _openDB();
    Map<String, dynamic> contactData = {
      'username': username,
      'password': password
    };
    setState(() async {
      contactId = await db.insert('contacts', contactData);
    });
  }

  @override
  Widget build(BuildContext context) {
    _openDB();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(onChanged: (value) => {username = value}),
            TextField(
              onChanged: (value) => {password = value},
            ),
            ElevatedButton(
              onPressed: () => {},
              child: const Text("Cadastrar"),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
