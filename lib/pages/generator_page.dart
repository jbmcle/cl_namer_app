import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../components/big_card.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var wordPair = appState.currentWordPair;

    var icon = appState.favs.contains(wordPair)
        ? Icons.favorite
        : Icons.favorite_outline;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(wordPair),
          const SizedBox(height: 10.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon: Icon(icon),
                label: const Text('Fav'),
                onPressed: () {
                  appState.toggleFav();
                },
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                  child: const Text('NEW'), onPressed: () => appState.getNext()
              )
            ],
          )
        ],
      ),
    );
  }
}
