// ignore_for_file: prefer_const_constructors
import 'package:diarios_eletronicos/components/header.dart';
import 'package:diarios_eletronicos/pages/consulta_dia.dart';
import 'package:flutter/material.dart';

class ConsultaMesPage extends StatelessWidget {
  const ConsultaMesPage({super.key});

  final List<String> meses = const [
    'JAN',
    'FEV',
    'MAR',
    'ABR',
    'MAI',
    'JUN',
    'JUL',
    'AGO',
    'SET',
    'OUT',
    'NOV',
    'DEZ'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Column(
                children: const [
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
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                      left: 40,
                      right: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < meses.length / 2; i++)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(87, 118, 176, 1.0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ConsultaDiaPage()));
                            },
                            child: Text(
                              meses[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                      left: 20,
                      right: 25,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 6; i < meses.length; i++)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(87, 118, 176, 1.0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ConsultaDiaPage()));
                            },
                            child: Text(
                              meses[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
