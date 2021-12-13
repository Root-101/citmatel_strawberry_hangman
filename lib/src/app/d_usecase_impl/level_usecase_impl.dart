import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

class LevelUseCaseImpl extends DefaultReadUseCase<LevelDomain>
    implements LevelUseCase {
  LevelUseCaseImpl(List<LevelDomain> info) : super(info);
}
