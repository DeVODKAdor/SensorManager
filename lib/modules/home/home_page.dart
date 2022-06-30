import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:payflow2/shared/themes/app_text_styles.dart';

import '../../shared/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance;

  bool valor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                  title: Text.rich(TextSpan(
                    text: "Olá",
                    style: TextStyles.titleRegular,
                  )),
                  subtitle: Text("Gerencie os seus sensores",
                      style: TextStyles.captionShape),
                  trailing: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)))),
            ),
          )),
      body: Center(
        child: Column(
          children: [
            Switch(
                value: valor,
                onChanged: (bool valor) {
                  setState(() {
                    db
                        .collection("sensores")
                        .doc("Led")
                        .set({"ativado": valor});
                  });
                }),
            Switch(
                value: valor,
                onChanged: (bool valor) {
                  setState(() {
                    db
                        .collection("sensores")
                        .doc("Luminosidade")
                        .set({"ativado": valor});
                  });
                }),
            Switch(
                value: valor,
                onChanged: (bool valor) {
                  setState(() {
                    db
                        .collection("sensores")
                        .doc("Proximidade")
                        .set({"ativado": valor});
                  });
                }),
            Switch(
                value: valor,
                onChanged: (bool valor) {
                  setState(() {
                    db
                        .collection("sensores")
                        .doc("Som")
                        .set({"ativado": valor});
                  });
                }),
            Switch(
                value: valor,
                onChanged: (bool valor) {
                  setState(() {
                    db
                        .collection("sensores")
                        .doc("Vibração")
                        .set({"ativado": valor});
                  });
                }),
          ],
        ),
      ),
    );
  }
}
