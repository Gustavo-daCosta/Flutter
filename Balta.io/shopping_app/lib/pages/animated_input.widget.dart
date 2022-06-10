import 'package:flutter/material.dart';

class TesteStateful extends StatefulWidget {
  const TesteStateful({ Key? key }) : super(key: key);

  @override
  State<TesteStateful> createState() => _TesteStatefulState();
}

class _TesteStatefulState extends State<TesteStateful> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class AnimatedInput extends StatelessWidget {
  final AnimationController controller;
  final Animation<Color?> containerColorAnim;
  final Animation<double> containerOpacityAnim;
  final Animation<double> containerBorderRadiusAnim;
  final Animation<double> containerSizeAnim;

  AnimatedInput({
    Key? key,
    required this.controller,
  })  : containerOpacityAnim = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(0.7, 0.9),
        )),
        containerSizeAnim = Tween(
          begin: 60.0,
          end: 300.0,
        ).animate(CurvedAnimation(
            parent: controller, curve: const Interval(0.2, 0.3))),
        containerBorderRadiusAnim = Tween(
          begin: 0.0,
          end: 30.0,
        ).animate(CurvedAnimation(
            parent: controller, curve: const Interval(0.25, 0.4))),
        containerColorAnim = ColorTween(
          begin: Colors.white.withOpacity(0),
          end: Colors.black12,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.25),
        )),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _animate,
      animation: controller,
    );
  }

  Widget _animate(context, child) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
          color: containerColorAnim.value,
          borderRadius: BorderRadius.all(
              Radius.circular(containerBorderRadiusAnim.value))),
      margin: const EdgeInsets.all(5),
      width: containerSizeAnim.value,
      child: Opacity(
        opacity: containerOpacityAnim.value,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.search),
            const SizedBox(width: 15),
            SizedBox(
              width: 150,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Search...",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
