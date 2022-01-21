import 'dart:io';

import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

class HangManRepoModule {
  static late final Store
      _STORE; //todo: posible null pointer, llamar primero al constructor

  static late final HangManSubLevelProgressRepo subLevelProgressRepo;

  static const _HangManDir = "/hangman";

  static Future<bool> init({String parentDirectory = ""}) async {
    //obtiene el directorio por defecto
    Directory defaultDir = await defaultStoreDirectory();

    //se concatenan las direcciones
    Directory dbDir =
        Directory('${defaultDir.path}$parentDirectory$_HangManDir');

    //Se crea el directorio por si no está creado
    dbDir = await dbDir.create(recursive: true);

    _STORE = await openStore(directory: dbDir.path);

    HangManSubLevelProgressRepoExternal subLevelProgressRepoExternal =
        HangManSubLevelProgressRepoExternalImpl(_STORE);

    subLevelProgressRepo =
        HangManSubLevelProgressRepoImpl(subLevelProgressRepoExternal);

    return _STORE != null;
  }

  static void dispose() {
    _STORE.close();
  }
}
