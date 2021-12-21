import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

class HangManLevelUseCaseImpl extends DefaultReadUseCase<HangManLevelDomain>
    implements HangManLevelUseCase {
  HangManLevelUseCaseImpl(List<HangManLevelDomain> info) : super(info);
}
