import 'package:flutter/material.dart';
import 'package:bible_da_lu/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? Icons.brightness_4
                  : Icons.brightness_2,
            ),
            onPressed: () {
              Theme.of(context).brightness == Brightness.light
                  ? MyApp.of(context)?.changeTheme(ThemeMode.dark)
                  : MyApp.of(context)?.changeTheme(ThemeMode.light);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 25,
              width: double.infinity,
            ),
            Container(
              alignment: Alignment.center,
              height: 200,
              width: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(200)),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: AssetImage("assets/icons/icon-random.png")
                        //image: AssetImage("assets/icons/icon_bibliadalu.jpg"),
                        )),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset(
                //   Theme.of(context).brightness == Brightness.light
                //       ? "assets/icons/light_theme icons/icon-instagram.png"
                //       : "assets/icons/dark_theme icons/icon-instagram.png",
                // ),
                const SizedBox(width: 7),
                const Text(
                  "rede",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Últimas Postagens",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(
                //verticalDirection: VerticalDirection.down,

                )
          ],
        ),
      ),
    );
  }
}
