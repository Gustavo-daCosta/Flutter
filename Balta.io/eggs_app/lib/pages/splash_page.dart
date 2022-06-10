import 'package:flare_flutter/flare_actor.dart';
import 'package:eggs_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  Future delay(context) async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    delay(context);
    
    return Scaffold(
      body: Column(
        children: const <Widget>[
          SizedBox(height: 60,),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: FlareActor(
              "assets/animations/egg-cooking.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              isPaused: false,
              animation: 'start',
            ),
          ),
          Text(
            "Perfect Eggs",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      )
    );
  }
}