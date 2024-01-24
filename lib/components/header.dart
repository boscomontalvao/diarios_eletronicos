// ignore_for_file: prefer_const_constructors

import 'package:diarios_eletronicos/components/modal_busca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
              iconSize: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info,
                      color: Color.fromRGBO(30, 48, 80, 1.0),
                    ),
                    iconSize: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(68, 83, 191, 1.0),
                        elevation: 2,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 35),
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
        ),
      ],
    );
  }
}
