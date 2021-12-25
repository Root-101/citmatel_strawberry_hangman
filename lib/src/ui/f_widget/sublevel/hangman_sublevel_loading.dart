import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HangManSubLevelLoading extends StatelessWidget {
  static const int DURATION = 3; //loading timeout

  final VoidCallback onEnd;

  //hay que controlarlo por indice, si se pone el random directo en el build() cambia la animacion cuando se da back o cosas similares
  int _kitIndex = 0;

  HangManSubLevelLoading({Key? key, required this.onEnd}) : super(key: key) {
    _kitIndex = Random().nextInt(kits.length);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loading(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _loadingWidget();
        } else {
          onEnd.call();
          return Container(); //hay que devolver algo
        }
      },
    );
  }

  _loading() async {
    await Future.delayed(Duration(seconds: HangManSubLevelLoading.DURATION));
  }

  _loadingWidget() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Cargando nivel"),
          kits[_kitIndex], //a random loading every time
        ],
      ),
    );
  }

  late final kits = <Widget>[
    const SpinKitRotatingCircle(color: Colors.white),
    const SpinKitRotatingPlain(color: Colors.white),
    const SpinKitChasingDots(color: Colors.white),
    const SpinKitPumpingHeart(color: Colors.white),
    const SpinKitPulse(color: Colors.white),
    const SpinKitDoubleBounce(color: Colors.white),
    const SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
    const SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
    const SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
    const SpinKitPianoWave(
        color: Colors.white, type: SpinKitPianoWaveType.start),
    const SpinKitPianoWave(
        color: Colors.white, type: SpinKitPianoWaveType.center),
    const SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.end),
    const SpinKitThreeBounce(color: Colors.white),
    const SpinKitThreeInOut(color: Colors.white),
    const SpinKitWanderingCubes(color: Colors.white),
    const SpinKitWanderingCubes(color: Colors.white, shape: BoxShape.circle),
    const SpinKitCircle(color: Colors.white),
    const SpinKitFadingFour(color: Colors.white),
    const SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
    const SpinKitFadingCube(color: Colors.white),
    const SpinKitCubeGrid(size: 51.0, color: Colors.white),
    const SpinKitFoldingCube(color: Colors.white),
    const SpinKitRing(color: Colors.white),
    const SpinKitDualRing(color: Colors.white),
    const SpinKitSpinningLines(color: Colors.white),
    const SpinKitFadingGrid(color: Colors.white),
    const SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle),
    const SpinKitSquareCircle(color: Colors.white),
    const SpinKitSpinningCircle(color: Colors.white),
    const SpinKitSpinningCircle(color: Colors.white, shape: BoxShape.rectangle),
    const SpinKitFadingCircle(color: Colors.white),
    const SpinKitHourGlass(color: Colors.white),
    const SpinKitPouringHourGlass(color: Colors.white),
    const SpinKitPouringHourGlassRefined(color: Colors.white),
    const SpinKitRipple(color: Colors.white),
    const SpinKitDancingSquare(color: Colors.white),
  ];
}
