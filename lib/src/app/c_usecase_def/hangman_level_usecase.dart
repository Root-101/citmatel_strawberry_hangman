import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

abstract class HangManLevelUseCase extends ReadUseCase<HangManLevelDomain> {
  String themeOfGivenLevel(HangManSubLevelProgressDomain progressDomain);
}
