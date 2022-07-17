import 'dart:math';

import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliver_fab/sliver_fab.dart';

class HangManLevelsScreen extends GetView<HangManLevelController> {
  static const ROUTE_NAME = "/hangman-levels-screen";
  final bool mute;

  HangManLevelsScreen({
    Key? key,
    required this.mute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double expandedHeight = Get.size.height * 0.3;
    //si es menos de 56 que es el por defecto lanza excepcion
    double collapsedHeight = max(Get.size.width / 10, 60);

    double randomWidth = deviceSize.width / 17;

    return GetBuilder<HangManLevelController>(builder: (_) {
      HangManLevelDomain conocGeneral =
          HangManLevelGeneral.levelConocimientoGeneral;
      //update la pantalla general de los temas,
      int winedStarsAll = controller.winedStarsAll();
      int maxStarsAll = controller.maxStarsAll();

      //scaffold para el fondo blanco
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: HangManUIModule.SECONDARY_COLOR.withOpacity(0.5),
          child: SliverFab(
            floatingWidget: StrawberryWidgets.circularButtonWithIcon(
              size: deviceSize.width / 9,
              backgroundColor: const Color(0xff00a4db),
              splashColor: const Color(0xff002edb).withOpacity(0.5),
              onPressed: () {
                Get.to(
                  Scaffold(
                    body: Function.apply(controller.randomSubLevel, [mute])
                        as Widget,
                  ),
                );
              },
              child: Pulse(
                child: Tooltip(
                  child: FaIcon(
                    FontAwesomeIcons.random,
                    size: randomWidth,
                    color: Colors.white,
                  ),
                  message: "Nivel Aleatorio.",
                ),
              ),
            ),
            floatingPosition: FloatingPosition(
              right: 16,
              //formula para que el boton no caiga encima de la puntuacion
              top: -(2 * randomWidth - 48),
            ),
            expandedHeight: expandedHeight,
            slivers: <Widget>[
              CommonsSliverAppBar.buildAppBar(
                expandedHeight: expandedHeight,
                collapsedHeight: collapsedHeight,
                backgroundColor: HangManUIModule.PRIMARY_COLOR,
                title: HangManUIModule.MODULE_NAME,
                urlBackgroundImage: HangManUIModule.URL_MODULE_BACKGROUND,
                maxStars: maxStarsAll,
                winedStars: winedStarsAll,
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: [
                  CommonsLevelsThemeSingleTile<HangManLevelDomain>(
                    winedStars: HangManLevelTutorial.tutorialSubLevelProgress(
                      starsMultiplier:
                          HangManSubLevelController.STARS_MULTIPLIER,
                    ).stars,
                    maxStars: HangManSubLevelController.MAX_STARS,
                    wonedLevel:
                        controller.wonedLevel(HangManLevelTutorial.tutorial),

                    //levelDomain para generar las cosas de aqui
                    singleLevelDomain: HangManLevelTutorial.tutorial,
                    //color primario, principalmente para animaciones
                    colorPrimary: HangManLevelTutorial
                        .tutorial.themeBackgroundImage.colorStrong,
                    //tema del tile, generado a partir del `levelDomain`
                    buildThemeName: (levelDomain) => levelDomain.theme,
                    //foto del tema del tile, generado a partir del `levelDomain`
                    buildThemeUrlImage: (levelDomain) =>
                        levelDomain.themeBackgroundImage.urlImage,
                    //nivel abierto, entrar directo al juego
                    openWidget: HangManSubLevelLoading(
                      mute: mute,
                      subLevelDomain: HangManLevelTutorial.tutorialSubLevel,
                      subLevelProgressDomain:
                          HangManLevelTutorial.tutorialSubLevelProgress(
                        starsMultiplier:
                            HangManSubLevelController.STARS_MULTIPLIER,
                      ),
                    ),
                  ),
                  ...conocGeneral.sublevel
                      .map((subLevelDomain) =>
                          GetBuilder<HangManLevelController>(builder: (_) {
                            //cargo el progreso de cada subnivel
                            HangManSubLevelProgressDomain progressDomain =
                                Get.find<HangManSubLevelProgressUseCase>()
                                    .findByAll(
                              conocGeneral,
                              subLevelDomain,
                            );
                            return CommonsSingleSubLevelTile(
                              level: subLevelDomain.id,
                              //el primario de aqui es el secundario del otro lado
                              colorPrimary:
                                  conocGeneral.themeBackgroundImage.colorLight,
                              backgroundColor:
                                  conocGeneral.themeBackgroundImage.colorStrong,
                              //estrellas ganadas en el subnivel
                              stars: progressDomain.stars,
                              maxStars: HangManSubLevelController.MAX_STARS,
                              startMultiplier:
                                  HangManSubLevelController.STARS_MULTIPLIER,
                              //cantidad de veces jugado el subnivel
                              contPlayedTimes: progressDomain.contPlayedTimes,
                              //nivel abierto, juego como tal
                              openWidget: HangManSubLevelLoading(
                                mute: mute,
                                subLevelDomain: subLevelDomain,
                                subLevelProgressDomain: progressDomain,
                              ),
                            );
                          }))
                      .toList(),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
