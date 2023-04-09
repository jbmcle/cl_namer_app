import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyAppState extends ChangeNotifier {

  var indexPage = 0;
  var favs = <String>[];
  var currentWordPair = WordPair.random();

  late HiveHelper _hiveHelper;

  MyAppState() {
    _hiveHelper = HiveHelper();
  }

  void setPageIndex(int index) {
    indexPage = index;
    notifyListeners();
  }

  void getNext() {
    currentWordPair = WordPair.random();
    notifyListeners();
  }

  void toggleFav() async {
    final fav = currentWordPair.toString();

    if (favs.contains(fav)) {
      favs.remove(fav);
      _hiveHelper.removeFav(fav);
    } else {
      favs.add(fav);
      _hiveHelper.addFav(fav);
    }

    notifyListeners();
  }

  void initHiveHelper() async => await _hiveHelper.initBox();

  List<dynamic> getPersistedFavs() => _hiveHelper.getFavorites();

}

class HiveHelper {

  final _favsListKey = 'favs';
  Box? _box;

  initBox() async { _box ??= await Hive.openBox('app_state_favs'); }

  addFav(String fav) {
    final list = getFavorites();
    list.add(fav);
    _box!.put(_favsListKey, list);
  }

  removeFav(String fav) {
    final list = getFavorites();
    list.remove(fav);
    _box!.put(_favsListKey, list);
  }

  List<dynamic> getFavorites() => _box!.get(_favsListKey, defaultValue: []);

}
