import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {

  var indexPage = 0;
  var favs = <WordPair>[];
  var currentWordPair = WordPair.random();

  void setPageIndex(int index) {
    indexPage = index;
    notifyListeners();
  }

  void getNext() {
    currentWordPair = WordPair.random();
    notifyListeners();
  }

  void toggleFav() {
    if (favs.contains(currentWordPair)) {
      favs.remove(currentWordPair);
    } else {
      favs.add(currentWordPair);
    }
    notifyListeners();
  }

}
