// ignore_for_file: prefer_const_constructors

import 'package:diarios_eletronicos/pages/consulta_ano.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 100,
            margin: const EdgeInsets.only(
              top: 40,
              left: 10,
              right: 10,
              bottom: 15,
            ),
            // padding: const EdgeInsets.only(bottom: 40),
            child: SvgPicture.asset('assets/Logo.svg'),
          ),
          Container(
            width: double.maxFinite,
            height: 330,
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.only(top: 180, bottom: 30, left: 20, right: 20),
            alignment: Alignment.center,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Diário Oficial Eletrônico da Justiça Federal da 5ª Região',
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Seção Judiciária do Sergipe',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Edição Administrativa',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(68, 83, 191, 1.0),
                elevation: 17,
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            child: Text(
              'Consultar Diários',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 29,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ConsultaAnoPage()));
            },
          )
        ],
      )),
    );
  }
}
