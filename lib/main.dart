import 'package:flutter/material.dart';

import 'data/repository/repository.dart';
import 'data/source/source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var repository = DefaultRepository();
  var songs = await repository.loadData();
  if (songs != null) {
    for (var song in songs) {
      debugPrint(song.toString());
    }
  }
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
