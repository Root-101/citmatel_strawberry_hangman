import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:clean_core/clean_core.dart';

class HangManLevelDomain extends BasicDomainObject<HangManLevelDomain> {
  int id;
  final String theme;
  final ToolsThemesBackgroundImage themeBackgroundImage;
  final List<HangManSubLevelDomain> sublevel;

  HangManLevelDomain({
    required this.id,
    required this.theme,
    required this.themeBackgroundImage,
    required this.sublevel,
  });

  @override
  HangManLevelDomain clone() {
    return HangManLevelDomain(
      id: this.id,
      theme: this.theme,
      themeBackgroundImage: this.themeBackgroundImage.clone(),
      sublevel: this.sublevel.map((e) => e.clone()).toList(),
    );
  }
}
