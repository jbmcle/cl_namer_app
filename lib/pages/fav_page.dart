import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class FavoritesPage extends StatelessWidget {

  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return appState.favs.isEmpty ?
        const Center(child: Text('Favorites will show here'))
        :
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'You have ${appState.favs.length} favorite(s)'
              ),
            ),
            for (var pair in appState.favs)
              ListTile(
                leading: const Icon(Icons.favorite),
                title: Text(pair.asLowerCase),
              )
          ],
        );
  }
}
