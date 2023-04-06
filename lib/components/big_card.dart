import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final WordPair wordPair;

  const BigCard(this.wordPair, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          wordPair.asCamelCase,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
