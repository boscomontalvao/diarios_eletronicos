import 'package:diarios_eletronicos/components/bottom_nav_bar.dart';
import 'package:diarios_eletronicos/components/diary.dart';
import 'package:diarios_eletronicos/components/floating_action_button.dart';
import 'package:diarios_eletronicos/repository/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  static Map<String, String> mounths = {
    '01': 'Janeiro',
    '02': 'Fevereiro',
    '03': 'Março',
    '04': 'Abril',
    '05': 'Maio',
    '06': 'Junho',
    '07': 'Julho',
    '08': 'Agosto',
    '09': 'Setembro',
    '10': 'Outubro',
    '11': 'Novembro',
    '12': 'Dezembro'
  };

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Future<List<String>> favoritesDiaries = FirebaseDB.getFavoritesDiaries();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    bottom: 15.0,
                    right: 2.0,
                    left: 2.0,
                  ),
                  child: SvgPicture.asset('assets/Logo.svg'),
                ),

                //ano e mês
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 25),
                  child: const Text(
                    'Favoritos',
                    style: TextStyle(
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
                future: favoritesDiaries,
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
                        List<String> splittedDate = dates[index].split('-');
                        String? mounthName =
                            FavoritesScreen.mounths[splittedDate[2]];
                        String nnMounthName = '';
                        if (mounthName != null) {
                          nnMounthName = mounthName;
                        }
                        return Diary(
                          fullDate: dates[index].replaceAll('-', '/'),
                          mes: nnMounthName,
                          ano: splittedDate[2],
                          onFavoriteChanged: (isFavorite) {
                            // Atualiza o estado do FavoritesScreen
                            setState(() {
                              favoritesDiaries =
                                  FirebaseDB.getFavoritesDiaries();
                            });
                          },
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
