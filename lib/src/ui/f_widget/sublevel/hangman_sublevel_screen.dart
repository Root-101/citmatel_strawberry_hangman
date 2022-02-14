import 'package:animations/animations.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart'
    hide FadeInAnimation, FadeIn;
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// ignore: must_be_immutable
class HangManSubLevelScreen extends StatefulWidget {
  static const ROUTE_NAME = "/hangman-sublevel-screen";

  HangManSubLevelScreen({
    required HangManSubLevelDomain subLevelDomain,
    required HangManSubLevelProgressDomain subLevelProgressDomain,
  }) : super() {
    Get.put<HangManSubLevelController>(
      HangManSubLevelControllerImpl(
        subLevelDomain: subLevelDomain,
        subLevelProgressDomain: subLevelProgressDomain,
      ),
    );
  }

  @override
  State<HangManSubLevelScreen> createState() => _HangManSubLevelScreenState();
}

class _HangManSubLevelScreenState extends State<HangManSubLevelScreen> {
  late final HangManSubLevelController _controller;
  List<TargetFocus> targets = [];

  // Steps in the tutorial.
  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();
  GlobalKey _key4 = GlobalKey();
  GlobalKey _key5 = GlobalKey();
  GlobalKey _key6 = GlobalKey();
  GlobalKey _key7 = GlobalKey();
  GlobalKey _keyAppBarBack = GlobalKey();
  GlobalKey _keyAppBarStars = GlobalKey();
  GlobalKey _keyAppBarLevel = GlobalKey();
  GlobalKey _keyAppBarTheme = GlobalKey();

  @override
  void initState() {
    _controller = Get.find();

    if (_controller.showTutorial) {
      //Start showcase view after current widget frames are drawn.
      WidgetsBinding.instance!.addPostFrameCallback(
        (duration) async {
          // Is necessary to wait a few seconds because the widgets haven't been created.
          await Future.delayed(Duration(milliseconds: 500));
          // Initialice the steps of the tutorial.
          initTargets();
          // Start the tutorial.
          _controller.initTutorialCoachMark(
            context: context,
            targets: targets,
          );
        },
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    Get.delete<HangManSubLevelController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///el get builder se pone general para que actualize desde las estrellas en tiempo real hasta el estado del nivel
    return GetBuilder<HangManSubLevelController>(builder: (_) {
      return CommonsSubLevelBuilder.buildScaffold(
        backKey: _controller.showTutorial ? _keyAppBarBack : null,
        levelKey: _controller.showTutorial ? _keyAppBarLevel : null,
        themeKey: _controller.showTutorial ? _keyAppBarTheme : null,
        starsKey: _controller.showTutorial ? _keyAppBarStars : null,
        tema: _controller.subLevelTheme(),
        nivel: _controller.subLevelNumber(),
        stars: _controller.generateProgress(),
        maxStar: HangManSubLevelController.MAX_STARS,
        deviceSize: size,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildListOfHearts(size),
                  _buildImageCard(size),
                  _buildWord(size),
                  _buildKeyBoard(size),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: StrawberryWidgets.confettiWidget(
                    confettiController: _controller.confettiController),
              ),
            ],
          ),
        ),
      );
    });
  }

  // Build the keyBoard Widget and all of its animations.
  _buildKeyBoard(Size size) {
    List<String> listOfLetters = _controller.keyboard;
    return _animatedGridView(
      key: _key4,
      size: size,
      // GridView amount of columns = ListLetter/6.
      cantOfColumns: _controller.keyboardColumns,
      children: List.generate(
        // List amount of items = ListLetters.
        listOfLetters.length,
        // Current item.
        (int index) {
          // If the letter is already used ...
          return _controller.isUsed(listOfLetters[index])
              // If the letter is correct, it belongs to the answer ...
              ? _controller.answerContainLetter(listOfLetters[index])
                  // Make the Bounce effect when is true and paint the letter green.
                  ? Bounce(
                      child: _emptyCard(
                        size: size,
                        text: listOfLetters[index],
                        decorationColor: Colors.lightGreen.shade300,
                        shadowColor: Colors.transparent,
                      ),
                    )
                  // Make the Shake effect when is false and paint the letter red.
                  : Shake(
                      child: _emptyCard(
                        size: size,
                        text: listOfLetters[index],
                        decorationColor: Colors.redAccent.shade100,
                        shadowColor: Colors.transparent,
                      ),
                    )
              // If the letter hasn't been used, paint it gray and call the method checkLetter() when is touched.
              : _buildAnimations(
                  index,
                  _controller.keyboardColumns,
                  InkWell(
                    key: listOfLetters[index] == _controller.firstAnswerLetter
                        ? _key5
                        : null,
                    child: _emptyCard(
                      size: size,
                      text: listOfLetters[index],
                      shadowColor: Colors.grey.shade700,
                    ),
                    onTap: () => _controller.checkLetter(
                        listOfLetters[index], context, _key6, _key7),
                  ),
                );
        },
      ),
    );
  }

  // Build the word Answer Widget and all of its animations.
  _buildWord(Size size) {
    List<String> listOfLetters = _controller.answerToBe;
    int countOfColumns = listOfLetters.length;
    return _animatedGridView(
      key: _key2,
      size: size,
      // Amount of Columns = Letters.
      cantOfColumns: countOfColumns,
      children: List.generate(
        // Amount of Items = Letters.
        countOfColumns,
        (int index) {
          // If the current item of the list of letters is blank...
          return listOfLetters[index].contains("_")
              // Make an empty letter card.
              ? _buildAnimations(
                  index,
                  6,
                  _emptyCard(
                    size: size,
                    text: listOfLetters[index],
                  ))
              //If it's fill show the RubberBand effect and put the correct letter.
              : RubberBand(
                  key: index == _controller.firstCorrectLetter ? _key6 : null,
                  child: _emptyCard(
                    size: size,
                    text: listOfLetters[index],
                  ));
        },
      ),
    );
  }

  // Build the List of Hearts Widget and all of its animations.
  _buildListOfHearts(Size size) {
    int countOfColumns = _controller.lives;
    return Padding(
      padding: EdgeInsets.only(left: size.width / 21),
      child: _animatedGridView(
        key: _key1,
        size: size,
        //    verticalPading: 0,
        // Amount of Columns = Hearts.
        cantOfColumns: countOfColumns,
        children: List.generate(
          // Amount of Items = Hearts.
          countOfColumns,
          // Current item.
          (int index) {
            // If the current item/heart is less that the losed lives ...
            return index < _controller.lives - _controller.remainingLives
                // Broke a heart and make the Swing animation.
                ? Swing(
                    key: index == 0 ? _key7 : null,
                    child: DecoratedIcon(
                      FontAwesomeIcons.heartBroken,
                      color: Colors.red.shade900,
                      size: size.width / 7.5,
                      shadows: [
                        BoxShadow(
                          blurRadius: 12.0,
                          color: Colors.grey.shade200,
                        ),
                        BoxShadow(
                          blurRadius: 12.0,
                          color: Colors.grey.shade200,
                          offset: Offset(0, 3.0),
                        ),
                      ],
                    ),
                  )
                // If it's a remaining live make a pumping heart.
                : _buildAnimations(
                    index,
                    countOfColumns,
                    HeartBeat(
                      child: DecoratedIcon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.red.shade900,
                        size: size.width / 7.5,
                        shadows: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Colors.grey.shade200,
                          ),
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Colors.grey.shade200,
                            offset: Offset(0, 3.0),
                          ),
                        ],
                      ),
                      preferences: AnimationPreferences(
                        autoPlay: AnimationPlayStates.Loop,
                        duration: Duration(seconds: 2),
                        magnitude: 0.5,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  // This method makes that the widget child enters to the screen with a Scale and Fade Animation.
  _buildAnimations(int index, int countOfColumns, Widget widget) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: countOfColumns,
      position: index,
      duration: const Duration(milliseconds: 1375),
      child: ScaleAnimation(
        scale: 0.5,
        child: FadeInAnimation(
          child: widget,
        ),
      ),
    );
  }

// This method animates the GridView so the items simulate to be entering to the screen one by one.
  _animatedGridView({
    required Key key,
    required int cantOfColumns,
    required List<Widget> children,
    required Size size,
  }) {
    return AnimationLimiter(
      key: key,
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.symmetric(
          horizontal: size.width / 21,
          vertical: size.width / 31,
        ),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        // Amount of columns in the grid
        crossAxisCount: cantOfColumns,
        //With this GridView only occupies the space it needs
        shrinkWrap: true,
        //No scroll needed
        physics: NeverScrollableScrollPhysics(),
        children: children,
      ),
    );
  }

  // This method creates a decorated empty card, that is going to have a letter in the middle.
  _emptyCard({
    required String text,
    Color decorationColor = Colors.white,
    Color shadowColor = Colors.grey,
    required Size size,
  }) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: decorationColor,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
            blurRadius: 6.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: Get.textTheme.subtitle2?.copyWith(
            fontSize: size.width / 17, //autosize
            color: Colors.black, //black xq el fondo siempre es blanco
          ),
        ),
      ),
    );
  }

  //This method is used to build the image widget.
  _buildImageCard(Size size) {
    return OpenContainer(
      key: _key3,
      // The transition to display when you move from the closed widget to the open one.
      transitionType: ContainerTransitionType.fade,
      transitionDuration: Duration(seconds: 1),
      openColor: Colors.transparent,
      // The content that will be displayed when the widget opens.
      openBuilder: (context, _) => _buildBigImage(),
      closedElevation: 20,
      closedColor: Colors.transparent,
      // The content that will be displayed when the widget is closed.
      closedBuilder: (context, _) => _buildSmallImage(size),
    );
  }

  //This method builds the image when is small.
  _buildSmallImage(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width / 21),
      height: size.height / 3,
      child: ClipRRect(
        // For the rounded corners
        borderRadius: BorderRadius.all(Radius.circular(15)),
        // Call the _fadeImage method for the fade effect.
        child: _fadeImage(_controller.imageUrl),
      ),
    );
  }

  //This method builds the image when it fills the entire screen.
  _buildBigImage() {
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      alignment: Alignment.center,
      // Call the _animateImage so the image can use diferents tipes of gestures.
      child: SafeArea(
        child: Stack(
          children: [
            _animateImage(_controller.imageUrl),
            Positioned(
              child: StrawberryWidgets.circularButtonWithIcon(
                onPressed: () => Get.back(closeOverlays: true),
                backgroundColor: Colors.black26,
                child: StrawberryWidgets.pulseIconAnimation(
                  icon: Icons.arrow_back,
                ),
              ),
              top: 10,
              left: 10,
            ),
          ],
        ),
      ),
    );
  }

  //Fade the entrance of the image.
  _fadeImage(String imageUrl) {
    return FadeIn(
      child: _animateImage(imageUrl),
      duration: Duration(milliseconds: 4000),
      curve: Curves.easeInOutCirc,
    );
  }

  //Addind gestures to the image.
  _animateImage(String imageUrl) {
    return PhotoView(
      imageProvider: AssetImage(imageUrl),
      //So the image only can be increased to a fit size.
      maxScale: PhotoViewComputedScale.covered * 2.0,
      // So the image only can be reduced to a fit size.
      minScale: PhotoViewComputedScale.covered,
      // The initial scale takes all the available space.
      initialScale: PhotoViewComputedScale.covered,
      // Color of the background space when the image is reduce
      backgroundDecoration: BoxDecoration(color: Colors.transparent),
    );
  }

  // Targets for the tutorial.
  void initTargets() {
    targets.add(
      StrawberryTutorial.addTarget(
        identify: "Target Back Button",
        keyTarget: _keyAppBarBack,
        shadowColor: Colors.blue.shade800,
        title: 'Atrás',
        description:
            'Pulse este botón si desea volver a la pantalla de niveles.',
        showImageOnTop: false,
        imagePadding: 50,
      ),
    );

    targets.add(
      StrawberryTutorial.addTarget(
        identify: "Target Level",
        keyTarget: _keyAppBarLevel,
        shadowColor: Colors.red,
        title: 'Nivel',
        description: 'Este número indica el nivel en el que se encuentra.',
        showImageOnTop: false,
        imagePadding: 50,
      ),
    );

    targets.add(
      StrawberryTutorial.addTarget(
        identify: "Target Theme",
        keyTarget: _keyAppBarTheme,
        shadowColor: Colors.cyan.shade900,
        title: 'Tema',
        description:
            'Este texto indica el tema del nivel en el que se encuentra.',
        showImageOnTop: false,
        imagePadding: 50,
      ),
    );

    targets.add(
      StrawberryTutorial.addTarget(
        identify: "Target Stars",
        keyTarget: _keyAppBarStars,
        shadowColor: Colors.teal,
        title: 'Estrellas',
        description:
            'Las estrellas indican cuan bien has realizado el nivel.\nPara obtenerlas todas debes completar el nivel sin equivocarte ni una sola vez.',
        showImageOnTop: false,
        imagePadding: 50,
      ),
    );

    targets.add(
      StrawberryTutorial.addTarget(
        identify: "Target Hearts",
        keyTarget: _key1,
        shadowColor: Colors.pink,
        title: 'Cantidad de vidas.',
        description:
            'Las vidas son la cantidad de intentos que tienes para equivocarte.\nSi las pierdes todas deberás empezar el nivel de nuevo.',
        showImageOnTop: false,
        imagePadding: 50,
      ),
    );

    targets.add(
      StrawberryTutorial.addMultipleTarget(
        identify: "Target Word",
        keyTarget: _key2,
        shadowColor: Colors.deepPurple,
        contentTextAlign: ContentAlign.bottom,
        contentImageAlign: ContentAlign.top,
        title: 'Palabra a completar.',
        description:
            'Debes completar correctamente la palabra para poder ganar.',
      ),
    );

    targets.add(
      StrawberryTutorial.addTarget(
        identify: "Target Image",
        keyTarget: _key3,
        shadowColor: Colors.deepOrange,
        title: 'Imagen de ayuda.',
        shape: ShapeLightFocus.Circle,
        description:
            'Esta imagen tiene relación con la palabra a completar, por lo que te puede servir de ayuda para ganar el nivel.',
        showImage: false,
      ),
    );

    targets.add(
      StrawberryTutorial.addTarget(
        identify: "Target Keyboard",
        keyTarget: _key4,
        shadowColor: Colors.indigo,
        contentAlign: ContentAlign.top,
        title: 'Teclado.',
        description:
            'Todas las letras necesarias para completar la palabra se encuentran en este teclado.',
        imagePadding: 50,
      ),
    );
    targets.add(
      StrawberryTutorial.addTarget(
        identify: "Target Drop",
        keyTarget: _key5,
        shadowColor: Colors.purple,
        contentAlign: ContentAlign.top,
        title: 'Letra.',
        description:
            'Debes pulsar cada una de las letras correctas para completar la palabra.'
            '\nPor ejemplo toca la letra ${_controller.firstAnswerLetter} para completar exitosamente la primera letra de la palabra.',
        shape: ShapeLightFocus.Circle,
        imagePadding: 50,
      ),
    );
  }
}
