import 'package:flutter/material.dart';
import 'package:shopping_app/pages/animated_input.widget.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool menuOpened = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      AnimatedInput(controller: _controller),
      TextButton(
        child: AnimatedIcon(
          color: Theme.of(context).iconTheme.color,
          icon: AnimatedIcons.menu_close,
          progress: _controller,
          semanticLabel: "Open Menu",
        ),
        onPressed: () {
          !menuOpened ? _controller.forward() : _controller.reverse();
          menuOpened = !menuOpened;
        },
      ),
    ]);
  }
}
