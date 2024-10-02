import 'package:flutter/material.dart';

class HomePAge extends StatefulWidget {
  final database;
  const HomePAge(this.database);

  @override
  State<HomePAge> createState() => _HomePAgeState(database);
}

class _HomePAgeState extends State<HomePAge> {
  final database;
  _HomePAgeState(this.database);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.green,
        )
      ],
    );
  }
}
