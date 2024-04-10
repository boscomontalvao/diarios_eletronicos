import 'package:diarios_eletronicos/components/bottom_nav_bar.dart';
import 'package:diarios_eletronicos/components/floating_action_button.dart';
import 'package:diarios_eletronicos/components/header.dart';
import 'package:diarios_eletronicos/repository/firebase.dart';
import 'package:diarios_eletronicos/screens/month_search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YearSearchScreen extends StatefulWidget {
  const YearSearchScreen({super.key});

  @override
  State<YearSearchScreen> createState() => _YearSearchScreenState();
}

class _YearSearchScreenState extends State<YearSearchScreen> {
  final List<String> anos = const ['2023', '2022', '2021', '2020'];

  final user = FirebaseAuth.instance.currentUser!;

  final userRegistred = FirebaseDB.registerUser();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //Header
            const Expanded(
              flex: 3,
              child: Header(),
            ),

            //Botões do anos
            Expanded(
              flex: 9,
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          anos.length,
                          (index) => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(87, 118, 176, 1.0),
                                  elevation: 17,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 80),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  anos[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 50,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const MonthSearchScreen(),
                                      settings: RouteSettings(
                                        arguments: anos[index],
                                      ),
                                    ),
                                  );
                                },
                              )),
                    ),
                  ),
                );
              }),
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
