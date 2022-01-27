import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HangManLevelsScreen extends GetView<HangManLevelController> {
  static const ROUTE_NAME = "/hangman-levels-screen";

  HangManLevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HangManLevelController>(
      builder: (context) {
        return CommonsLevelsThemeScreen<HangManLevelDomain>(
          levelsFindAll: controller.findAll(),
          urlSliverBackground: HangManAssets.WALLPAPER,
          singleThemeTileBuilder: (levelDomain) {
            return CommonsLevelsThemeSingleTile<HangManLevelDomain>(
              singleLevelDomain: levelDomain,
              colorPrimary: levelDomain.themeBackgroundImage.colorStrong,
              buildThemeName: (levelDomain) => levelDomain.theme,
              buildThemeUrlImage: (levelDomain) =>
                  levelDomain.themeBackgroundImage.urlImage,
              openWidget: CommonsSingleLevel<HangManSubLevelDomain>(
                themeTitle: levelDomain.theme,
                urlThemePicture: levelDomain.themeBackgroundImage.urlImage,
                colorPrimary: levelDomain.themeBackgroundImage.colorStrong,
                colorSecondary: levelDomain.themeBackgroundImage.colorLight,
                maxStars: 0,
                winedStars: 0,
                subLevelsAll: levelDomain.sublevel,
                singleSubLevelTileBuilder: (subLevelDomain) {
                  HangManSubLevelProgressDomain progressDomain =
                      Get.find<HangManSubLevelProgressUseCase>().findByAll(
                    levelDomain,
                    subLevelDomain,
                  );
                  return CommonsSingleSubLevelTile(
                    //el primario de aqui es el secundario del otro lado
                    colorPrimary: levelDomain.themeBackgroundImage.colorLight,
                    stars: progressDomain.stars,
                    contPlayedTimes: progressDomain.contPlayedTimes,
                    openWidget: HangManSubLevelLoading(
                      subLevelDomain: subLevelDomain,
                      subLevelProgressDomain: progressDomain,
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
