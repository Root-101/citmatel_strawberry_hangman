import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:citmatel_strawberry_tools/assets/assets_exporter.dart';
import 'package:clean_core/clean_core.dart';
import 'package:flutter_animator/utils/pair.dart';
import 'package:get/get.dart';

class HangManLevelUseCaseImpl extends DefaultReadUseCase<HangManLevelDomain>
    implements HangManLevelUseCase {
  HangManLevelUseCaseImpl(List<HangManLevelDomain> info) : super(info);

  @override
  String themeOfGivenLevel(HangManSubLevelProgressDomain progressDomain) {
    return levelOfProgress(progressDomain).a.theme;
  }

  @override
  ToolsThemesBackgroundImage themeLooksOfGivenLevel(
      HangManSubLevelProgressDomain progressDomain) {
    return levelOfProgress(progressDomain).a.themeBackgroundImage;
  }

  @override
  Pair<HangManLevelDomain, HangManSubLevelDomain> levelOfProgress(
      HangManSubLevelProgressDomain progressDomain) {
    HangManLevelDomain level = Get.find<HangManLevelUseCase>()
        .findBy(progressDomain.hangmanLevelDomainId);

    HangManSubLevelDomain subLevel = level.sublevel.firstWhere(
        (element) => element.id == progressDomain.hangmanSubLevelDomainId);

    return Pair(level, subLevel);
  }

  @override
  Pair<HangManSubLevelDomain, HangManSubLevelProgressDomain> nextLevel(
      HangManSubLevelProgressDomain currentProgress) {
    Pair<HangManLevelDomain, HangManSubLevelDomain> current =
        levelOfProgress(currentProgress);

    int currentSubLevelIndex = current.a.sublevel.indexOf(current.b);
    if (currentSubLevelIndex < current.a.sublevel.length - 1) {
      //no he llegado al ultimo de ese tema, sumo uno y sigo

      //el mismo nivel
      HangManLevelDomain nextLevel = current.a;
      //el proximo subnivel es el actual +1
      HangManSubLevelDomain nextSubLevel =
          current.a.sublevel[currentSubLevelIndex + 1];

      //por esos dos saco el progreso
      HangManSubLevelProgressDomain nextProgress =
          Get.find<HangManSubLevelProgressUseCase>()
              .findByAll(nextLevel, nextSubLevel);
      return Pair(nextSubLevel, nextProgress);
    } else if (currentSubLevelIndex >= current.a.sublevel.length - 1) {
      //ultimo subnivel

      //indice del nivel, para buscar el siguiente
      int currentLevelIndex = findAll().indexOf(current.a);

      //no he llegado al ultimo nivel
      if (currentLevelIndex < count() - 1) {
        //voy al siguiente nivel
        HangManLevelDomain nextLevel = findAll()[currentLevelIndex + 1];
        //cojo el primer subnivel del siguiente subnivel
        HangManSubLevelDomain nextSubLevel = nextLevel.sublevel[0];
        HangManSubLevelProgressDomain nextProgress =
            Get.find<HangManSubLevelProgressUseCase>()
                .findByAll(nextLevel, nextSubLevel);
        return Pair(nextSubLevel, nextProgress);
      } else {
        HangManLevelDomain firstLevel = findAll()[1];
        HangManSubLevelDomain nextSubLevel = firstLevel.sublevel[0];
        HangManSubLevelProgressDomain nextProgress =
            Get.find<HangManSubLevelProgressUseCase>()
                .findByAll(firstLevel, nextSubLevel);
        return Pair(nextSubLevel, nextProgress);
      }
    }
    //POR DEFECTO, NUNK SE DEBE LLAGAR AQUI
    //pal primer subnivel del primer nivel. Me salto el 0 que es el tutorial
    print("no se debe llegar aquí");
    return Pair(
        HangManLevelTutorial.tutorialSubLevel,
        HangManLevelTutorial
            .tutorialSubLevelProgress()); //TODO: pasarle el multiplier del controller, que en realidad deberia estar aqui
  }
}
