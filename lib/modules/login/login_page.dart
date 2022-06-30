import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflow2/modules/login/password_redefinition.dart';
import 'package:payflow2/shared/themes/app_colors.dart';
import 'package:payflow2/shared/themes/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
                color: AppColors.primary,
                width: size.width,
                height: size.height * 0.36),
            Positioned(
              bottom: size.height * 0.08,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 70, right: 70),
                    child: Text("Organize seus sensores num só lugar",
                        textAlign: TextAlign.center,
                        style: TextStyles.titleHome),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: TextField(
                      controller: senha,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Senha"),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(50),
                      child: ElevatedButton(
                          onPressed: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email.text,
                                password: senha.text,
                              );
                              Navigator.pushReplacementNamed(context, '/home');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                          },
                          child: const Text("Entrar"))),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/password');
                      },
                      child: const Text("Esqueci a minha senha")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/cadastro');
                      },
                      child: const Text("Criar conta"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
