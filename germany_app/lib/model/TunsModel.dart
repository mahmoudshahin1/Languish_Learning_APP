import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Tunsmodel {
  final Color color;
  final String sound;
  Tunsmodel({required this.color, required this.sound});
  playSound() {
    final player = AudioPlayer();
    player.play(AssetSource(sound));
  }
}
