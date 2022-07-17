import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';

class HangManLevelGeneral {
  static final HangManLevelDomain levelConocimientoGeneral = HangManLevelDomain(
    id: 1,
    theme: "Variado",
    themeBackgroundImage: ToolsThemesBackgroundImage(
      urlImage: "",
      colorStrong: const Color(0xff3b4c96),
      colorLight: const Color(0xff3fd4fc).withOpacity(0.5),
    ),
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "lluvia",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_1_LLUVIA,
      ),
      HangManSubLevelDomain(
        id: 2,
        answer: "suelo",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_2_SUELO,
      ),
      HangManSubLevelDomain(
        id: 3,
        answer: "contaminar",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_3_CONTAMINAR,
      ),
      HangManSubLevelDomain(
        id: 4,
        answer: "sequía",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_4_SEQUIA,
      ),
      HangManSubLevelDomain(
        id: 5,
        answer: "derrumbe",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_5_DERRUMBE,
      ),
      HangManSubLevelDomain(
        id: 6,
        answer: "deshecho",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_6_DESHECHO,
      ),
      HangManSubLevelDomain(
        id: 7,
        answer: "erosión",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_7_EROSION,
      ),
      HangManSubLevelDomain(
        id: 8,
        answer: "huracán",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_8_HURACAN,
      ),
      HangManSubLevelDomain(
        id: 9,
        answer: "ahorrar",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_9_AHORRAR,
      ),
      HangManSubLevelDomain(
        id: 10,
        answer: "surcos",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_10_SURCOS,
      ),
      HangManSubLevelDomain(
        id: 11,
        answer: "frutas",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_11_FRUTAS,
      ),
      HangManSubLevelDomain(
        id: 12,
        answer: "vaca",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_12_VACA,
      ),
      HangManSubLevelDomain(
        id: 13,
        answer: "pozo",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_13_POZO,
      ),
      HangManSubLevelDomain(
        id: 14,
        answer: "campesino",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_14_CAMPESINO,
      ),
      HangManSubLevelDomain(
        id: 15,
        answer: "riego",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_15_RIEGO,
      ),
      HangManSubLevelDomain(
        id: 16,
        answer: "postura",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_16_POSTURA,
      ),
      HangManSubLevelDomain(
        id: 17,
        answer: "fumigar",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_17_FUMIGAR,
      ),
      HangManSubLevelDomain(
        id: 18,
        answer: "terrazas",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_18_TERRAZAS,
      ),
      HangManSubLevelDomain(
        id: 19,
        answer: "fértil",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_19_FERTIL,
      ),
      HangManSubLevelDomain(
        id: 20,
        answer: "raices",
        urlImage: HangManAssetsNivelConocimientoGeneral.GENERAL_20_RAICES,
      ),
    ],
  );
}
