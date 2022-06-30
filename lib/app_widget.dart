import 'package:flutter/material.dart';
import 'package:payflow2/modules/home/home_page.dart';
import 'package:payflow2/modules/login/cadastro.dart';
import 'package:payflow2/modules/login/password_redefinition.dart';
import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pay Flow',
        theme: ThemeData(primaryColor: AppColors.primary),
        home: const LoginPage(),
        initialRoute: '/login',
        routes: {
          '/home': (context) => HomePage(),
          '/login': (context) => const LoginPage(),
          '/password': (context) => PasswordRedefinition(),
          '/cadastro':(context) => Cadastro()
        });
  }
}
