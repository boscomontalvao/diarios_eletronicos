import 'package:diarios_eletronicos/components/bottom_nav_bar.dart';
import 'package:diarios_eletronicos/components/diary.dart';
import 'package:diarios_eletronicos/components/floating_action_button.dart';
import 'package:diarios_eletronicos/components/header.dart';
import 'package:diarios_eletronicos/repository/firebase.dart';
import 'package:flutter/material.dart';

class DaySearchSreen extends StatefulWidget {
  const DaySearchSreen({super.key});

  @override
  State<DaySearchSreen> createState() => _DaySearchSreenState();
}

class _DaySearchSreenState extends State<DaySearchSreen> {
  @override
  Widget build(BuildContext context) {
    final yearMonth =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    final dates = FirebaseDB.fetchData(yearMonth[0], yearMonth[1]);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                const Header(),

                //ano e mês
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 25),
                  child: Text(
                    '${yearMonth[0]} / ${yearMonth[1]}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color.fromRGBO(75, 68, 68, 1.0),
                    ),
                  ),
                ),

                //Barra de divisão
                const SizedBox(height: 5),
                const Divider(
                  color: Color.fromRGBO(32, 112, 125, 1.0),
                  height: 2,
                  thickness: 6,
                  indent: 19,
                  endIndent: 19,
                ),
                const SizedBox(height: 10),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<String>>(
                future: dates,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    final dates = snapshot.data!;
                    return ListView.builder(
                      itemCount: dates.length,
                      itemBuilder: (context, index) {
                        return Diary(
                          fullDate: dates[index],
                          mes: yearMonth[1],
                          ano: yearMonth[0],
                        );
                      },
                    );
                  } else {
                    return const Text("No data available");
                  }
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
