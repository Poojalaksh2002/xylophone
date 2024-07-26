import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Xylophone(),
  ));
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  void playSound(int noteId) {
    final player = AudioPlayer();
    player.play(AssetSource('note$noteId.wav'));
  }

  Widget buildKey({required Color color, required int noteId}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            )),
        onPressed: () => playSound(noteId),
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, noteId: 1),
              buildKey(color: Colors.orange, noteId: 2),
              buildKey(color: Colors.yellow, noteId: 3),
              buildKey(color: Colors.green, noteId: 4),
              buildKey(color: Colors.teal, noteId: 5),
              buildKey(color: Colors.blue, noteId: 6),
              buildKey(color: Colors.purple, noteId: 7),
            ]),
      ),
    );
  }
}
