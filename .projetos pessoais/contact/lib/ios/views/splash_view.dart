import 'package:contact/android/styles.dart';
import 'package:flutter/cupertino.dart';

class SplashView extends StatelessWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: primaryColor,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              width: double.infinity,
            ),
            Icon(
              CupertinoIcons.padlock,
              size: 72,
              color: accentColor,
            ),
            SizedBox(height: 20,),
            Text(
              "Meus Contatos",
              style: TextStyle(
                fontSize: 24,
                color: accentColor,
              ),
            ),
          ],
        ),
      )
    );
  }
}