import 'package:eggs_app/blocs/app_blocs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Progress extends StatelessWidget {
  const Progress({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppBloc bloc = Provider.of<AppBloc>(context);
    return bloc.state == "cooking"
    ? progress(context, bloc)
    : const SizedBox();
  }

  Widget progress(BuildContext context, AppBloc bloc) {
    return Column(
      children: <Widget>[
        Text(
          (bloc.time - bloc.seconds).toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 45,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: LinearProgressIndicator(
            value: bloc.percent / 100,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(
              Theme.of(context).primaryColor
            ),
          ),
        )
      ],
    );
  }
}