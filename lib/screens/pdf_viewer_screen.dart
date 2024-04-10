import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerSrceen extends StatelessWidget {
  final String date;
  final File file;

  const PdfViewerSrceen({
    super.key,
    required this.date,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Center(
          child: Text(
            'Diário Eletrônico $date',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(68, 83, 191, 1.0),
      ),
      body: PDFView(
        filePath: file.path,
      ),
    );
  }
}
