import 'dart:math';

import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:get/get.dart';

class HangManSubLevelUseCaseImpl extends HangManSubLevelUseCase {
  ///para almacenar las letras que se han usado y poder desabilitarlas despues
  final Set<String> _usedLetters = {};

  ///domain almacenado para acceder a la info
  final HangManSubLevelDomain subLevelDomain;

  ///domain con la info del progreso
  final HangManSubLevelProgressDomain subLevelProgressDomain;

  ///letras de la respuesta
  late final List<String> answerLettersSpellOut;

  ///diferentes letras de la respuesta
  late final List<String> answerLettersDifferent;

  ///cantidad de letras del teclado
  late final int keyboardCantLetters;

  ///teclado como tal que se muestra, se debe asegurar que no tenga letras repetidas y siempre contenga las letras de la respuesta
  late final List<String> keyboard;

  ///el multiplo de las letras del tecaldo, para una distribución uniforme de las letras en la visual
  static const DEFAULT_KEYBOARD_COLUMNS = 7;
  static const MIN_CANT_LETTERS_KEYBOARD =
      2 * DEFAULT_KEYBOARD_COLUMNS; //min = 12
  static const MID_CANT_LETTERS_KEYBOARD =
      3 * DEFAULT_KEYBOARD_COLUMNS; //min = 18
  static const MAX_CANT_LETTERS_KEYBOARD =
      4 * DEFAULT_KEYBOARD_COLUMNS; //max = 24

  HangManSubLevelUseCaseImpl({
    required this.subLevelDomain,
    required this.subLevelProgressDomain,
  }) {
    answerLettersSpellOut = subLevelDomain.answer.toUpperCase().split("");
    answerLettersDifferent = answerLettersSpellOut.toSet().toList();
    keyboardCantLetters = _cantLettersKeyboard();
    keyboard = _generateKeyboard();
  }

  @override
  int get answerCantOfLetters => subLevelDomain.answer.length;

  ///cantidad de vidas maximas del nivel
  ///no se usa como getter por si hay que ponerle logica despues con comodines que aumenten las vidas
  /// si hay algun bono se le suma aqui a las vidad y ya
  @override
  int lives() {
    return subLevelDomain.lives;
  }

  ///todas las posiciones donde esta la letra, si esta vacia es xq la letra no va
  ///ademas marca la letra como usada
  @override
  List<int> checkLetter(String letter) {
    //marca la letra como usada
    _setLetterAsUsed(letter);
    //devuelve la lista con todas las posiciones dende este la letra
    return letter
        .toUpperCase()
        .allMatches(
          subLevelDomain.answer.toUpperCase(),
        )
        .map((e) => e.start)
        .toList();
  }

  ///true si la letra ya se uso
  bool isUsed(String letter) {
    return _usedLetters.contains(letter);
  }

  ///true si contiene la letra en al menos una posicion, si el checkLetter.length > 0
  @override
  bool answerContainLetter(String letter) {
    return checkLetter(letter).isNotEmpty;
  }

  ///genera el teclado, se debe asegurar que no tenga letras repetidas y siempre contenga las letras de la respuesta
  List<String> _generateKeyboard() {
    //cojo todas las letras
    List<String> allLetters =
        "abcdefghijklmnñopqrstuvwxyz".toUpperCase().split("");

    //quito las que ya están en la respuesta
    allLetters
        .removeWhere((element) => answerLettersDifferent.contains(element));

    //las vuelvo aleatorias
    allLetters.shuffle();

    //cojo las que necesito para completar el teclado
    int faltan = keyboardCantLetters - answerLettersDifferent.length;

    //creo finalmente la lista del teclado
    List<String> keyboard = [];
    //agrego las originales
    keyboard.addAll(answerLettersDifferent);
    //agrego las extras
    keyboard.addAll(allLetters.sublist(0, faltan));
    //lo mexclo de nuevo
    keyboard.shuffle();

    //lo limpio de nuevo para si por si acaso, no puede reducirse
    keyboard = keyboard.toSet().toList();

    return keyboard;
  }

  ///genera la cantidad de letras que va a tener el teclado basandose en la cantidad de letras de la respuesta
  ///se tiene que asegurar que la cantidad sea multiplo de `DEFAULT_KEYBOARD_COLUMNS`
  int _cantLettersKeyboard() {
    // de [1  ...  6]     =>  12
    // de [7  ... 12]    =>  18
    // de [13 ... 23]    =>  24
    // mas de 24       =>  ERROR
    if (answerLettersDifferent.length <= DEFAULT_KEYBOARD_COLUMNS) {
      return MIN_CANT_LETTERS_KEYBOARD;
    } else if (answerLettersDifferent.length <= MIN_CANT_LETTERS_KEYBOARD) {
      return MID_CANT_LETTERS_KEYBOARD; //super error si se llega aqui
    } else if (answerLettersDifferent.length > MID_CANT_LETTERS_KEYBOARD &&
        answerLettersDifferent.length < MAX_CANT_LETTERS_KEYBOARD) {
      return MAX_CANT_LETTERS_KEYBOARD; //middle
    } else {
      throw Exception("Muchas letras en la palabra");
    }
  }

  ///marca la letra como usada
  void _setLetterAsUsed(String letter) {
    _usedLetters.add(letter);
  }

  void saveProgress(int stars) {
    //me quedo siempre con la mejor cantidad de estrellas
    subLevelProgressDomain.stars = max(subLevelProgressDomain.stars, stars);

    //aumento la cantidad de veces que se jugo el nivel
    subLevelProgressDomain.contPlayedTimes =
        subLevelProgressDomain.contPlayedTimes + 1;

    //salvo el progreso
    _executeProgressUpdate();
  }

  void _executeProgressUpdate() {
    Get.find<HangManSubLevelProgressUseCase>().edit(subLevelProgressDomain);
  }

  @override
  bool showTutorial() {
    return subLevelProgressDomain.hangmanLevelDomainId ==
            Get.find<HangManLevelUseCase>().findAll()[0].id &&
        subLevelProgressDomain.hangmanSubLevelDomainId ==
            Get.find<HangManLevelUseCase>().findAll()[0].sublevel[0].id;
  }

  @override
  String get firstAnswerLetter => subLevelDomain.answer[0];

  String subLevelTheme() {
    return Get.find<HangManLevelUseCase>()
        .findAll()[subLevelProgressDomain.hangmanLevelDomainId]
        .theme;
  }

  int subLevelNumber() {
    return subLevelDomain.id;
  }
}
