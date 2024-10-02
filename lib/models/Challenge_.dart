import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Challege {
  final int id;
  final String title;

  final String text;
  final bool done;
  final bool confirmed;

  const Challege({
    required this.id,
    required this.title,
    required this.text,
    required this.done,
    required this.confirmed,
  });
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'text': text,
      "done": done,
      "confirmed": confirmed,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Challenge{id: $id, title: $title, text: $text ,done: $done, confirmed: $confirmed}';
  }
}

Future<void> insertDog(Challege challenge, database) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'challenge',
    challenge.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
