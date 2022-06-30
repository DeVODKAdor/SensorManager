import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/themes/app_text_styles.dart';

class PasswordRedefinition extends StatefulWidget {
  const PasswordRedefinition({Key? key}) : super(key: key);

  @override
  State<PasswordRedefinition> createState() => _PasswordRedefinitionState();
}

class _PasswordRedefinitionState extends State<PasswordRedefinition> {

  final email = TextEditingController();
  final senha = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
          child: TextField(
            controller: email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-mail',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
          child: TextField(
            controller: senha,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Senha"),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(50),
          child: ElevatedButton(
            onPressed: null,
            child: Text("Redefinir"),
          )
        )
      ],
    );
  }
}
