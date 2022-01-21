import 'package:animations/animations.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';

class HangManSingleLevelTile extends StatelessWidget {
  final HangManSubLevelDomain subLevelDomain;
  final HangManSubLevelProgressDomain subLevelProgressDomain;
  final bool showTutorial;

  const HangManSingleLevelTile({
    required this.subLevelDomain,
    required this.subLevelProgressDomain,
    required this.showTutorial,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OpenContainer(
        transitionDuration: Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => _buildClosed(),
        openBuilder: (context, action) => _buildOpen(),
      ),
    );
  }

  //Tile chiquito que se muestra en la lista con todos los subniveles
  _buildClosed() {
    return Container(
      child: Column(
        children: [
          Text('level id ${subLevelProgressDomain.hangmanLevelDomainId}'),
          Text(
              'sub level id ${subLevelProgressDomain.hangmanSubLevelDomainId}'),
          Text('start ${subLevelProgressDomain.stars}'),
          Text('played times ${subLevelProgressDomain.contPlayedTimes}'),
        ],
      ),
    );
  }

  //Screen grande para cuando se entra al subnivel, pantalla de cargando para el sub nivel
  _buildOpen() {
    return HangManSubLevelLoading(
      subLevelDomain: subLevelDomain,
      subLevelProgressDomain: subLevelProgressDomain,
      showTutorial: showTutorial,
    );
  }
}
