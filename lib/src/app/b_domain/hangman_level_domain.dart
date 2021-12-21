import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';


class HangManLevelDomain extends BasicDomainObject {
  int id;
  final String theme;
  final String urlThemePicture;
  final List<HangManSubLevelDomain> sublevel;

  HangManLevelDomain({
    required this.id,
    required this.theme,
    required this.urlThemePicture,
    required this.sublevel,
  });
}
