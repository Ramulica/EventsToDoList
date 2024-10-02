import 'package:flutter/material.dart';
import 'package:hallowenapp/pages/home_paage.dart';
import 'package:hallowenapp/pages/user_page.dart';
import 'package:hallowenapp/widgets/app_bar.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'challenge.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE challenge(id INTEGER PRIMARY KEY, title TEXT, text INTEGER, done INTEGER, confirmed INTEGER)',
      );
    },
    version: 1,
  );

  runApp(MyApp(database));
}

class MyApp extends StatelessWidget {
  dynamic database;
  MyApp(this.database);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 153, 74, 0),
              foregroundColor: Colors.white,
              title: const Text('Acasă'),
              bottom: const TabBar(
                indicatorColor: const Color.fromARGB(255, 153, 74, 0),
                unselectedLabelColor: Colors.white,
                labelColor: Colors.white,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                dividerHeight: 0,
                tabs: <Widget>[
                  Tab(
                    text: 'Acasă',
                  ),
                  Tab(
                    text: "Titluri tarifare",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Center(
                  child: HomePAge(database),
                ),
                Center(
                  child: ProfilePage1(),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.small(
              shape: const CircleBorder(),
              backgroundColor: const Color.fromARGB(255, 153, 74, 0),
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
