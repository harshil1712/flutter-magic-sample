import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

import 'package:flutter_magic_sample/login.dart';

void main() {
  runApp(const MyApp());
  Magic.instance = Magic("YOUR_PUBLISHABLE_KEY");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [
      MaterialApp(
        title: 'Flutter Magic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
      Magic.instance.relayer
    ]));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Flutter Magic ✨'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
