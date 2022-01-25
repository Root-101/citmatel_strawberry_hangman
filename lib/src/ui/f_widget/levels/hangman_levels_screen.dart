import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HangManLevelsScreen extends GetView<HangManLevelController> {
  static const ROUTE_NAME = "/hangman-levels-screen";

  HangManLevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonsLevelsScreen<HangManLevelDomain>(
      levelsFindAll: controller.findAll(),
      buildSingleLevel: (levelDomain) {
        return GetBuilder<HangManLevelController>(builder: (context) {
          return CommonsSingleLevel<HangManSubLevelDomain>(
            moduleName: "HangMan",
            themeTitle: levelDomain.theme,
            maxStars: Get.find<HangManLevelController>().maxStars(levelDomain),
            winedStars:
                Get.find<HangManLevelController>().winedStars(levelDomain),
            urlThemePicture: levelDomain.urlThemePicture,
            subLevelsAll: (levelDomain).sublevel,
            singleLevelBuilder: (subLevelDomain) {
              HangManSubLevelProgressDomain progressDomain =
                  Get.find<HangManSubLevelProgressUseCase>().findByAll(
                levelDomain,
                subLevelDomain,
              );
              return CommonsSingleSubLevelTile(
                stars: progressDomain.stars,
                contPlayedTimes: progressDomain.contPlayedTimes,
                openWidget: HangManSubLevelLoading(
                  subLevelDomain: subLevelDomain,
                  subLevelProgressDomain: progressDomain,
                ),
              );
            },
          );
        });
      },
    );
  }
}
