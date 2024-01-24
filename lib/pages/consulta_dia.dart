// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:diarios_eletronicos/components/header.dart';
import 'package:flutter/material.dart';

class ConsultaDiaPage extends StatelessWidget {
  const ConsultaDiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Header(),
                  Divider(
                    color: Color.fromRGBO(32, 112, 125, 1.0),
                    height: 35,
                    thickness: 8,
                    indent: 25,
                    endIndent: 25,
                  ),
                ],
              ),
            ),
            Container(
              height: 750,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1.0),
                  border: Border.all(
                    color: Color.fromRGBO(32, 122, 125, 1.0),
                    width: 1.5,
                  )),
              child: Column(
                children: [
                  _linhaTabela(
                    icon: Icons.picture_as_pdf_outlined,
                    text: 'Diário Eletrônico Administrativo SJSE 101.0/2023',
                    date: '01/01/2022',
                  ),
                  _linhaTabela(
                    icon: Icons.picture_as_pdf_outlined,
                    text: 'Diário Eletrônico Administrativo SJSE 101.0/2023',
                    date: '02/01/2022',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _linhaTabela(
      {required IconData icon, required String text, required String date}) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.0),
      child: Row(
        children: [
          Icon(icon),
          Text(text),
          SizedBox(width: 30.0),
          Text(date),
        ],
      ),
    );
  }
}
