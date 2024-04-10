import 'package:diarios_eletronicos/components/favorite_button.dart';
import 'package:diarios_eletronicos/repository/firebase.dart';
import 'package:diarios_eletronicos/screens/pdf_viewer_screen.dart';
import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  final String fullDate;
  final String mes;
  final String ano;
  final Function(bool)? onFavoriteChanged;

  const Diary({
    super.key,
    required this.fullDate,
    required this.mes,
    required this.ano,
    this.onFavoriteChanged,
  });

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  Future<List<String>> favoritesDiaries = FirebaseDB.getFavoritesDiaries();
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    favoritesDiaries = FirebaseDB.getFavoritesDiaries();
    favoritesDiaries.then((list) {
      setState(() {
        isFavorite = list.contains(widget.fullDate.replaceAll('/', '-'));
      });
    });
  }

  void toggleFavorite() async {
    if (await FirebaseDB.favoriteDiary(widget.fullDate, isFavorite)) {
      setState(() {
        isFavorite = !isFavorite;
      });

      if (widget.onFavoriteChanged != null) {
        widget.onFavoriteChanged!(isFavorite);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(32, 112, 125, 1),
            width: 2,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            //Título e data dos diários
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Diário Eletrônico',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.fullDate,
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
              ],
            ),

            //Botões de favoriotar e baixar diários
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FavoriteButton(
                    date: widget.fullDate,
                    isFavorite: isFavorite,
                    onTap: toggleFavorite,
                  ),
                  IconButton(
                    onPressed: () async {
                      final file = await FirebaseDB.getPDFFromFirebase(
                          '${widget.ano}/${widget.mes}/Diário ${widget.fullDate.replaceAll("/", "-")}.pdf',
                          context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerSrceen(
                            date: widget.fullDate,
                            file: file,
                          ),
                        ),
                      );
                    },
                    tooltip: 'Baixar PDF',
                    icon: const Icon(
                      Icons.picture_as_pdf,
                      color: Color.fromRGBO(32, 112, 125, 1.0),
                    ),
                    iconSize: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
