// ignore_for_file: prefer_const_constructors

import 'package:diarios_eletronicos/components/modal_busca.dart';
import 'package:diarios_eletronicos/components/tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            bottom: 15.0,
            right: 2.0,
            left: 2.0,
          ),
          child: SvgPicture.asset('assets/Logo.svg'),
        ),
        //Botões
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Info
              InfoButtom(),
              //Filtrar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(68, 83, 191, 1.0),
                    elevation: 2,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: Text(
                  'Filtrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: (context) => ModalBusca());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
