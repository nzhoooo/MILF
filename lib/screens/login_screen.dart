// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class LoginScreen extends StatelessWidget {
  final String? username;

  const LoginScreen({
    super.key,
    this.username,
  });

  final Color rwColor =const Color.fromARGB(188, 255, 67, 50);
  final TextStyle focusedStyle = const TextStyle(color: Colors.redAccent);
  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 44.0),
            children: [
              const SizedBox(
                height: 200,
                child: Image(
                  image: AssetImage(
                    'assets/fooderlich_assets/rw_logo.png',
                  ),
                ),
                
              ),
              const Text('                                                 MILF',style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 17, 17, 17))),
              const SizedBox(height: 16),
              buildTextfield(username ?? 'Username'),
              const SizedBox(height: 16),
              buildTextfield('Password'),
              const SizedBox(height: 16),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: rwColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          Provider.of<AppStateManager>(context, listen: false)
 .login('mockUsername', 'mockPassword');
        },
      ),
    );
  }

  Widget buildTextfield(String hintText) {
    return TextField(
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}
