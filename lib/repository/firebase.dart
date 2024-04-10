import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDB {
  static Future<List<String>> fetchData(ano, mes) async {
    final storageRef = FirebaseStorage.instance.ref().child("$ano/$mes");
    final listResult = await storageRef.listAll();
    List<String> names = [];
    List<String> dates = [];

    for (var itens in listResult.items) {
      names.add(itens.name);
    }

    for (String date in names) {
      date = date.replaceAll('-', '/');
      dates.add(date.substring(date.indexOf(' ') + 1, date.indexOf('.pdf')));
    }
    return dates;
  }

  static Future<String> getPdfURL(String stringDate) async {
    String url = '';
    List<String> splittedDate = stringDate.split('/');
    splittedDate[0] = splittedDate[0] == '01'
        ? '31'
        : (int.parse(splittedDate[0]) - 1).toString();
    String formattedDate =
        '${splittedDate[2]}-${splittedDate[1]}-${splittedDate[0]}';

    DateTime date = DateTime.parse(formattedDate);

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('diarios')
          .where('data_publicacao', isEqualTo: date)
          .get();

      url = querySnapshot.docs.first['pdf'];
    } catch (error) {
      return error.toString();
    }

    return url;
  }

  static Future<File> getPDFFromFirebase(
      String url, BuildContext context) async {
    try {
      final pdfRef = FirebaseStorage.instance.ref().child(url);
      final bytes = await pdfRef.getData();

      return saveFile(url, bytes!);
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<File> saveFile(String url, List<int> bytes) async {
    final fileName = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);

    return file;
  }

  static Future<User?> registerUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user?.uid)
        .get();

    if (user != null && userQuery.docs.isEmpty) {
      usersCollection.add({'uid': user.uid, 'email': user.email});
    }

    return user;
  }

  static Future<bool> favoriteDiary(String diaryDate, bool fav) async {
    User? user = FirebaseAuth.instance.currentUser;
    QuerySnapshot userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user?.uid)
        .get();

    if (userQuery.docs.isNotEmpty && !fav) {
      DocumentReference userDoc = userQuery.docs.single.reference;
      try {
        await userDoc.update({
          'diarios_favoritos': FieldValue.arrayUnion([
            FirebaseFirestore.instance
                .collection('diarios')
                .doc('Diário ${diaryDate.replaceAll('/', '-')}')
          ])
        });
        return true;
      } catch (e) {
        Future.error(e);
        return false;
      }
    } else if (userQuery.docs.isNotEmpty && fav) {
      DocumentReference userDoc = userQuery.docs.single.reference;

      try {
        await userDoc.update({
          'diarios_favoritos': FieldValue.arrayRemove([
            FirebaseFirestore.instance
                .collection('diarios')
                .doc('Diário ${diaryDate.replaceAll('/', '-')}')
          ])
        });
        return true;
      } catch (e) {
        e.toString();
        return false;
      }
    }
    return false;
  }

  static Future<List<String>> getFavoritesDiaries() async {
    User? user = FirebaseAuth.instance.currentUser;
    List<String> favoritesDiariesDates = [];
    Query<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user?.uid);

    try {
      QuerySnapshot<Map<String, dynamic>> userSnapshot = await users.get();
      if (userSnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot<Map<String, dynamic>> userData =
            userSnapshot.docs.single;
        List<DocumentReference> favoritesDiaries =
            List<DocumentReference>.from(userData['diarios_favoritos'] ?? []);

        for (var element in favoritesDiaries) {
          favoritesDiariesDates
              .add(element.path.substring(element.path.indexOf(' ') + 1));
        }
        return favoritesDiariesDates;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
