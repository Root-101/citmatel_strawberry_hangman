import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:citmatel_strawberry_tools/assets/assets_exporter.dart';
import 'package:clean_core/clean_core.dart';
import 'package:flutter_animator/flutter_animator.dart';

abstract class HangManLevelUseCase extends ReadUseCase<HangManLevelDomain> {
  String themeOfGivenLevel(HangManSubLevelProgressDomain progressDomain);

  ToolsThemesBackgroundImage themeLooksOfGivenLevel(
      HangManSubLevelProgressDomain progressDomain);

  Pair<HangManLevelDomain, HangManSubLevelDomain> levelOfProgress(
      HangManSubLevelProgressDomain progressDomain);

  Pair<HangManSubLevelDomain, HangManSubLevelProgressDomain> nextLevel(
      HangManSubLevelProgressDomain currentProgress);
}
