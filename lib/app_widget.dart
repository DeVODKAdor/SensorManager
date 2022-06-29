import 'package:flutter/material.dart';
import 'package:payflow2/modules/home/home_page.dart';
import 'package:payflow2/modules/splashes/splash_page.dart';
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
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/home': (context) => HomePage(),
          '/login': (context) => const LoginPage()
        });
  }
}
