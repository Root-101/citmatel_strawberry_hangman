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
          tutorialTile: CommonsLevelsThemeSingleTile<HangManLevelDomain>(
            //levelDomain para generar las cosas de aqui
            singleLevelDomain: HangManLevelTutorial.tutorial,
            //color primario, principalmente para animaciones
            colorPrimary:
                HangManLevelTutorial.tutorial.themeBackgroundImage.colorStrong,
            //tema del tile, generado a partir del `levelDomain`
            buildThemeName: (levelDomain) => levelDomain.theme,
            //foto del tema del tile, generado a partir del `levelDomain`
            buildThemeUrlImage: (levelDomain) =>
                levelDomain.themeBackgroundImage.urlImage,
            //nivel abierto, entrar directo al juego
            openWidget: HangManSubLevelLoading(
              subLevelDomain: HangManLevelTutorial.tutorialSubLevel,
              subLevelProgressDomain:
                  HangManLevelTutorial.tutorialSubLevelProgress(),
            ),
          ),
          //widget que se genera cada vez que se selecciona el aleatorio
          onRandomTap: controller.randomSubLevel,
          //lista de los niveles
          levelsFindAll: controller.findAll(),
          //bakcground del sliver
          urlSliverBackground: HangManAssets.WALLPAPER,
          //builder de cada tile, uno por tema/uno por nivel
          singleThemeTileBuilder: (levelDomain) {
            //single level/tema tile por defecto
            return CommonsLevelsThemeSingleTile<HangManLevelDomain>(
              //levelDomain para generar las cosas de aqui
              singleLevelDomain: levelDomain,
              //color primario, principalmente para animaciones
              colorPrimary: levelDomain.themeBackgroundImage.colorStrong,
              //tema del tile, generado a partir del `levelDomain`
              buildThemeName: (levelDomain) => levelDomain.theme,
              //foto del tema del tile, generado a partir del `levelDomain`
              buildThemeUrlImage: (levelDomain) =>
                  levelDomain.themeBackgroundImage.urlImage,
              //nivel abierto, lista de subniveles
              openWidget: CommonsSingleLevel<HangManSubLevelDomain>(
                //level domain para random
                levelDomain: levelDomain,
                //funcion para generar un nivel random cada vez, recive por defecto el levelDomain
                onRandomOfTap: controller.randomSubLevelOf,
                //titulo del tema
                themeTitle: levelDomain.theme,
                //foto del tema, para mostrar en el sliver
                urlThemePicture: levelDomain.themeBackgroundImage.urlImage,
                //color fuerte relacionado con la imagen
                colorPrimary: levelDomain.themeBackgroundImage.colorStrong,
                //color debil relacionado con la imagen
                colorSecondary: levelDomain.themeBackgroundImage.colorLight,
                //estrellas maximas a ganar
                maxStars: 0,
                //estrellas ganadas
                winedStars: 0,
                //lista de los subniveles del tema
                subLevelsAll: levelDomain.sublevel,
                //builder de cada tile
                singleSubLevelTileBuilder: (subLevelDomain) {
                  //cargo el progreso de cada subnivel
                  HangManSubLevelProgressDomain progressDomain =
                      Get.find<HangManSubLevelProgressUseCase>().findByAll(
                    levelDomain,
                    subLevelDomain,
                  );
                  //tile generico
                  return CommonsSingleSubLevelTile(
                    //el primario de aqui es el secundario del otro lado
                    colorPrimary: levelDomain.themeBackgroundImage.colorLight,
                    //estrellas ganadas en el subnivel
                    stars: progressDomain.stars,
                    //cantidad de veces jugado el subnivel
                    contPlayedTimes: progressDomain.contPlayedTimes,
                    //nivel abierto, juego como tal
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
