// ignore_for_file: prefer_const_constructors
import 'package:diarios_eletronicos/components/header.dart';
import 'package:diarios_eletronicos/pages/consulta_mes.dart';
import 'package:flutter/material.dart';

class ConsultaAnoPage extends StatelessWidget {
  const ConsultaAnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 3; i >= 0; i--)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(87, 118, 176, 1.0),
                          elevation: 17,
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 150),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          '202$i',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 60,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ConsultaMesPage()));
                        },
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
