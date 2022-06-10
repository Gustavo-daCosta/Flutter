import 'package:eggs_app/widgets/action_button_widget.dart';
import 'package:eggs_app/widgets/eggs_widget.dart';
import 'package:eggs_app/widgets/progress_widget.dart';
import 'package:eggs_app/widgets/type_buttons_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView(
          children: const <Widget>[
            SizedBox(height: 50,),
            Text(
              "Perfect Eggs",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Eggs(),
            Padding(
              padding: EdgeInsets.all(20),
              child: TypeButtons(),
            ),
            Progress(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: ActionButtons(),
            )
          ],
        ),
      )
    );
  }
}