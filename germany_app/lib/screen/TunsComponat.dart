import 'package:flutter/material.dart';
import 'package:germany_app/model/TunsModel.dart';

class Tunscomponat extends StatelessWidget {
  const Tunscomponat({super.key, required this.tune});
  final Tunsmodel tune;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          tune.playSound();
        },
        child: Container(
          color: tune.color,
        ),
      ),
    );
  }
}
