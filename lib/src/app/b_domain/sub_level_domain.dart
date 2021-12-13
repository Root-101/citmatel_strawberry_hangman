import 'package:clean_core/clean_core.dart';

class SubLevelDomain extends BasicDomainObject {
  int id;
  final String urlImage;
  final int lives;
  final String answer;

  SubLevelDomain({
    required this.id,
    required this.urlImage,
    required this.answer,
    this.lives = 5,
  });
}
