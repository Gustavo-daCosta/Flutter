import 'package:flutter/material.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/widgets/search_box.dart';
import '../widgets/category/category_list_widget.dart';
import '../widgets/products/product_list_widget.dart';
// import 'package:custom_switch/custom_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          // color: const Color(0xfff5f5f5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              const SearchBox(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  /*
                  CustomSwitch(
                    activeColor: Colors.pinkAccent,
                    value: _switchValue,
                    onChanged: (value) {
                      Icon(
                        Theme.of(context).brightness == Brightness.light
                        ? Icons.brightness_4
                        : Icons.brightness_2,
                        color: Theme.of(context).iconTheme.color,
                      );
                      setState(() {
                        _switchValue = value;
                        Theme.of(context).brightness == Brightness.light
                        ? MyApp.of(context)?.changeTheme(ThemeMode.dark)
                        : MyApp.of(context)?.changeTheme(ThemeMode.light);
                      });
                    },
                  ),
                  */
                  ElevatedButton(
                    onPressed: () {
                      Theme.of(context).brightness == Brightness.light
                      ? MyApp.of(context)?.changeTheme(ThemeMode.dark)
                      : MyApp.of(context)?.changeTheme(ThemeMode.light);
                    },
                    child: Icon(
                      Theme.of(context).brightness == Brightness.light
                      ? Icons.brightness_4
                      : Icons.brightness_2,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).backgroundColor)
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 120,
                child: const CategoryList(),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Best Selling",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  TextButton(
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 315,
                child: const ProductList(scrollDirection: Axis.horizontal,),
              ),
            ],
          )),
    );
  }
}
