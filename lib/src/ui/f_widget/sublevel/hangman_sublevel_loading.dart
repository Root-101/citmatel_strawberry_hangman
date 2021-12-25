import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HangManSubLevelLoading extends StatelessWidget {
  static const int DURATION = 3; //loading timeout

  final VoidCallback onEnd;

  HangManSubLevelLoading({Key? key, required this.onEnd}) : super(key: key);

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
          const SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
        ],
      ),
    );
  }
}
