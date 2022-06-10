import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PartyPage extends StatefulWidget {
  const PartyPage({Key? key}) : super(key: key);

  @override
  State<PartyPage> createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> {
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;
  AudioCache audioCache = AudioCache();
  //AudioPlayer advancedPlayer = AudioPlayer();
  bool tocandoMusica = false;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
    _controllerCenterRight.play();
    _controllerCenterLeft.play();
    _controllerTopCenter.play();
    _controllerBottomCenter.play();
  }

  @override
  Widget build(BuildContext context) {
    Path drawStar(Size size) {
      // Method to convert degree to radians
      double degToRad(double deg) => deg * (pi / 180.0);

      const numberOfPoints = 5;
      final halfWidth = size.width / 2;
      final externalRadius = halfWidth;
      final internalRadius = halfWidth / 2.5;
      final degreesPerStep = degToRad(360 / numberOfPoints);
      final halfDegreesPerStep = degreesPerStep / 2;
      final path = Path();
      final fullAngle = degToRad(360);
      path.moveTo(size.width, halfWidth);

      for (double step = 0; step < fullAngle; step += degreesPerStep) {
        path.lineTo(halfWidth + externalRadius * cos(step),
            halfWidth + externalRadius * sin(step));
        path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
            halfWidth + internalRadius * sin(step + halfDegreesPerStep));
      }
      path.close();
      return path;
    }

    Widget confete(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: const AssetImage("assets/noteswallpaper.png"),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                //CENTER -- Blast
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality
                        .explosive, // don't specify a direction, blast randomly
                    shouldLoop:
                        true, // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                    createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "FELIZ\nANIVERSÁRIO!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                //CENTER RIGHT -- Emit left
                Align(
                  alignment: Alignment.centerRight,
                  child: ConfettiWidget(
                    confettiController: _controllerCenterRight,
                    blastDirection: pi, // radial value - LEFT
                    particleDrag: 0.05, // apply drag to the confetti
                    emissionFrequency: 0.05, // how often it should emit
                    numberOfParticles: 20, // number of particles to emit
                    gravity: 0.05, // gravity - or fall speed
                    shouldLoop: false,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink
                    ], // manually specify the colors to be used
                    strokeWidth: 1,
                    strokeColor: Colors.white,
                  ),
                ),
                //CENTER LEFT - Emit right
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConfettiWidget(
                    confettiController: _controllerCenterLeft,
                    blastDirection: 0, // radial value - RIGHT
                    emissionFrequency: 0.6,
                    minimumSize: const Size(10,
                        10), // set the minimum potential size for the confetti (width, height)
                    maximumSize: const Size(50,
                        50), // set the maximum potential size for the confetti (width, height)
                    numberOfParticles: 1,
                    gravity: 0.1,
                  ),
                ),

                //TOP CENTER - shoot down
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _controllerTopCenter,
                    blastDirection: pi / 2,
                    maxBlastForce: 5, // set a lower max blast force
                    minBlastForce: 2, // set a lower min blast force
                    emissionFrequency: 0.05,
                    numberOfParticles: 50, // a lot of particles at once
                    gravity: 1,
                  ),
                ),
                //BOTTOM CENTER
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ConfettiWidget(
                    confettiController: _controllerBottomCenter,
                    blastDirection: -pi / 2,
                    emissionFrequency: 0.01,
                    numberOfParticles: 20,
                    maxBlastForce: 100,
                    minBlastForce: 80,
                    gravity: 0.3,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            height: 90,
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0))),
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                size: 72,
                              ),
                              onPressed: () async {
                                audioCache.play(
                                    '../assets/audio/hojeSeuAniversuario.mp3');
                                setState(() {
                                  !tocandoMusica;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    }

    return confete(context);
    /*return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    body: const Center(
      child: Text(
        "Teste",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );*/
  }
}
