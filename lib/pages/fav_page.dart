import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class FavoritesPage extends StatelessWidget {

  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    var list = appState.getPersistedFavs().isEmpty ? appState.favs : appState.getPersistedFavs();

    return list.isEmpty ?
        const Center(child: Text('Favorites will show here'))
        :
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'You have ${list.length} favorite(s)'
              ),
            ),
            for (var pair in list)
              ListTile(
                leading: const Icon(Icons.favorite),
                title: Text(pair),
              )
          ],
        );
  }
}
