import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/pages/login_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          LoginPage(),
          const HomePage(),
          const CartPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const [
          Tab(
            icon: Icon(Icons.perm_identity),
          ),
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Theme.of(context).primaryIconTheme.color,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
