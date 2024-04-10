import 'package:diarios_eletronicos/components/bottom_nav_bar.dart';
import 'package:diarios_eletronicos/components/floating_action_button.dart';
import 'package:diarios_eletronicos/components/header.dart';
import 'package:diarios_eletronicos/screens/day_search_screen.dart';
import 'package:flutter/material.dart';

class MonthSearchScreen extends StatelessWidget {
  const MonthSearchScreen({super.key});

  final List<String> meses = const [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  @override
  Widget build(BuildContext context) {
    final ano = ModalRoute.of(context)!.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                const Header(),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    ano,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                      color: Color.fromRGBO(75, 68, 68, 1.0),
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromRGBO(32, 112, 125, 1.0),
                  height: 4,
                  thickness: 8,
                  indent: 25,
                  endIndent: 25,
                ),
              ],
            ),
            Expanded(
              flex: 12,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: meses.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 25.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(87, 118, 176, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const DaySearchSreen(),
                            settings: RouteSettings(
                              arguments: [ano, meses[index]],
                            ),
                          ),
                        );
                      },
                      child: Text(
                        meses[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
        floatingActionButton: const FAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
