import 'package:clean_core/clean_core.dart';

class HangManSubLevelDomain extends BasicDomainObject<HangManSubLevelDomain> {
  int id;
  final String urlImage;
  final int lives;
  final String answer;

  HangManSubLevelDomain({
    required this.id,
    required this.urlImage,
    required this.answer,
    this.lives = 5,
  });

  @override
  HangManSubLevelDomain clone() {
    return HangManSubLevelDomain(
      id: this.id,
      urlImage: this.urlImage,
      lives: this.lives,
      answer: this.answer,
    );
  }
}
