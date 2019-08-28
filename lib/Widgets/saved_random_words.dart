import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedRandomWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Set<WordPair> saved = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: SavedList(
        savedSet: saved,
      ),
    );
  }
}

class SavedList extends StatelessWidget {
  final Set<WordPair> savedSet;

  SavedList({Key key, @required this.savedSet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = savedSet.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: const TextStyle(fontSize: 18.0),
          ),
        );
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return ListView(
      children: divided,
    );
  }
}
