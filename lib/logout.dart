import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final magic = Magic.instance;

  Future logout() async {
    await magic.user.logout();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Logout'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Successfully Logged In'),
              ElevatedButton(
                child: const Text('Logout'),
                onPressed: logout,
              ),
            ],
          ),
        ));
  }
}
