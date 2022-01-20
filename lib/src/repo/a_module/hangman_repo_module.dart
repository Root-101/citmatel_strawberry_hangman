import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:objectbox/objectbox.dart';

class HangManRepoModule {
  static late final Store
      _STORE; //todo: posible null pointer, llamar primero al constructor

  static late final HangManSubLevelProgressRepo subLevelProgressRepo;

  static Future<bool> init() async {
    Store store = await openStore().then((value) {
      _STORE = value;

      HangManSubLevelProgressRepoExternal subLevelProgressRepoExternal =
          HangManSubLevelProgressRepoExternalImpl(_STORE);

      subLevelProgressRepo =
          HangManSubLevelProgressRepoImpl(subLevelProgressRepoExternal);

      return value;
    });

    return store != null;
  }

  static void dispose() {
    _STORE.close();
  }
}
