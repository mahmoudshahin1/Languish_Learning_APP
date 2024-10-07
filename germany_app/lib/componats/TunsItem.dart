import 'package:flutter/material.dart';
import 'package:germany_app/model/TunsModel.dart';
import 'package:germany_app/screen/TunsComponat.dart';

class Tunsitem extends StatelessWidget {
  Tunsitem({super.key});
  final List<Tunsmodel> tunes = [
    Tunsmodel(color: Color(0xffF44336), sound: 'note1.wav'),
    Tunsmodel(color: Color(0xffF89800), sound: 'note2.wav'),
    Tunsmodel(color: Color(0xffFEEB3B), sound: 'note3.wav'),
    Tunsmodel(color: Color(0xff4CAF50), sound: 'note4.wav'),
    Tunsmodel(color: Color(0xff2F9688), sound: 'note5.wav'),
    Tunsmodel(color: Color(0xff2896F3), sound: 'note6.wav'),
    Tunsmodel(color: Color(0xff9C27B0), sound: 'note7.wav'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff253238),
            centerTitle: true,
            title: Text("Flutter Tune")),
        body: Column(
          children: tunes
              .map(
                (e) => Tunscomponat(
                  tune: e,
                ),
              )
              .toList(),
        ));
  }
}
