import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import 'fav_page.dart';
import 'generator_page.dart';

class MyNavigationPage extends StatelessWidget {
  const MyNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    selectedIndex: appState.indexPage,
                    destinations: const [
                      NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                      NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('Favorites'))
                    ],
                    onDestinationSelected: (index) => appState.setPageIndex(index),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: _getPageByIndex(appState.indexPage),
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return const GeneratorPage();
      case 1:
        return const FavoritesPage();
        break;
      default:
        throw UnimplementedError('No page found for index $index');
    }
  }

}
