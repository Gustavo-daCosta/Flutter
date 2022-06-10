import 'package:eggs_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/app_blocs.dart';

class TypeButtons extends StatelessWidget {
  const TypeButtons({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);
    return bloc.state == "stopped"
    ? buttons(bloc)
    : const SizedBox();
  }
  
  Widget buttons(AppBloc bloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Button(
          label: "Soft",
          selected: bloc.selected == "soft",
          callback: () {
            bloc.select("soft");
          },
        ),
        Button(
          label: "Medium",
          selected: bloc.selected == "medium",
          callback: () {
            bloc.select("medium");
          },
        ),
        Button(
          label: "Hard",
          selected: bloc.selected == "hard",
          callback: () {
            bloc.select("hard");
          },
        ),
      ],
    );
  }
}