import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:flutter_magic_sample/logout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final magic = Magic.instance;

  Future loginFunction({required String email}) async {
    try {
      await magic.auth.loginWithMagicLink(email: _emailController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LogoutPage()));
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      return null;
                    },
                    controller: _emailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginFunction(
                          email: _emailController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Check you email')));
                      }
                    },
                    child: const Text('Login'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
