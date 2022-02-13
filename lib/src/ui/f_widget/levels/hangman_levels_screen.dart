import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HangManLevelsScreen extends GetView<HangManLevelController> {
  static const ROUTE_NAME = "/hangman-levels-screen";

  HangManLevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HangManLevelController>(builder: (_) {
      //update la pantalla general de los temas,
      int winedStarsAll = controller.winedStarsAll();
      int maxStarsAll = controller.maxStarsAll();
      return CommonsLevelsThemeScreen<HangManLevelDomain>(
        tutorialTile: CommonsLevelsThemeSingleTile<HangManLevelDomain>(
          winedStars: HangManLevelTutorial.tutorialSubLevelProgress(
            starsMultiplier: HangManSubLevelController.STARS_MULTIPLIER,
          ).stars,
          maxStars: HangManSubLevelController.MAX_STARS,
          wonedLevel: controller.wonedLevel(HangManLevelTutorial.tutorial),

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
                HangManLevelTutorial.tutorialSubLevelProgress(
              starsMultiplier: HangManSubLevelController.STARS_MULTIPLIER,
            ),
          ),
        ),
        //widget que se genera cada vez que se selecciona el aleatorio
        onRandomTap: controller.randomSubLevel,
        //lista de los niveles
        levelsFindAll: controller.findAll(),
        title: HangManUIModule.MODULE_NAME,
        appbarBackgroundColor: HangManUIModule.PRIMARY_COLOR,
        backgroundColor: HangManUIModule.SECONDARY_COLOR.withOpacity(0.5),
        //background del sliver
        urlSliverBackground: HangManUIModule.URL_MODULE_BACKGROUND,
        winedStars: winedStarsAll,
        maxStars: maxStarsAll,
        //builder de cada tile, uno por tema/uno por nivel
        singleThemeTileBuilder: (levelDomain) {
          //single level/tema tile por defecto

          int winedStars = controller.winedStars(levelDomain);
          int maxStars = controller.maxStars(levelDomain);
          return CommonsLevelsThemeSingleTile<HangManLevelDomain>(
            //estrellas chiquitas de cada tile
            maxStars: maxStars,
            winedStars: winedStars,

            //marca el nivel como ganado o no
            wonedLevel: controller.wonedLevel(levelDomain),

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

            //este actualiza el tile de adentro(las 3 estrellas) y la cantidad de estrellas arriba
            openWidget: GetBuilder<HangManLevelController>(builder: (_) {
              //esto aqui duplicado para que se entere el GetBuilder
              int winedStars = controller.winedStars(levelDomain);
              int maxStars = controller.maxStars(levelDomain);

              return CommonsSingleLevel<HangManSubLevelDomain>(
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
                //estrellas ganadas
                winedStars: winedStars,
                //estrellas maximas a ganar
                maxStars: maxStars,
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
                  //TODO: UPDATE necesita actualizar las estrellas del sublevel tile
                  return CommonsSingleSubLevelTile(
                    level: subLevelDomain.id,
                    //el primario de aqui es el secundario del otro lado
                    colorPrimary: levelDomain.themeBackgroundImage.colorLight,
                    backgroundColor:
                        levelDomain.themeBackgroundImage.colorStrong,
                    //estrellas ganadas en el subnivel
                    stars: progressDomain.stars,
                    maxStars: HangManSubLevelController.MAX_STARS,
                    startMultiplier: HangManSubLevelController.STARS_MULTIPLIER,
                    //cantidad de veces jugado el subnivel
                    contPlayedTimes: progressDomain.contPlayedTimes,
                    //nivel abierto, juego como tal
                    openWidget: HangManSubLevelLoading(
                      subLevelDomain: subLevelDomain,
                      subLevelProgressDomain: progressDomain,
                    ),
                  );
                },
              );
            }),
          );
        },
      );
    });
  }
}
