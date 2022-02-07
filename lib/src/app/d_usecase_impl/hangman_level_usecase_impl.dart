import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';
import 'package:get/get.dart';

class HangManLevelUseCaseImpl extends DefaultReadUseCase<HangManLevelDomain>
    implements HangManLevelUseCase {
  HangManLevelUseCaseImpl(List<HangManLevelDomain> info) : super(info);

  @override
  String themeOfGivenLevel(HangManSubLevelProgressDomain progressDomain) {
    return Get.find<HangManLevelUseCase>()
        .findBy(progressDomain.hangmanLevelDomainId)
        .theme;
  }
}
