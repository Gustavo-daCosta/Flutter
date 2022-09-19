import 'package:flutter/material.dart';
import 'package:to_do/models/categories.dart';
import 'package:to_do/components/lists/categorie_list.dart';
import 'package:to_do/components/lists/task_list.dart';
import 'package:to_do/screens/new_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text(
          "To-Do",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.blueGrey.shade600,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, anim1, anim2) => NewTaskPage(),
              transitionsBuilder: (context, anim, anim2, child) {
                return SizeTransition(
                  sizeFactor: anim,
                  axisAlignment: 0.0,
                  child: child,
                );
                /*FadeTransition(opacity: anim, child: child);*/
              },
              transitionDuration: const Duration(seconds: 4),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "What's up, \$name!",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$numberOfTasksPending tasks pending",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600]
                    ),
                  )
                ],
              ),
            ),
            titleBar(context, "Categories"),
            Container(
              padding: const EdgeInsets.only(left: 6),
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return categoriesList(index);
                }
              ),
            ),
            titleBar(context, "Tasks"),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListView.builder(
                  itemCount: 4,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return taskList(context, index);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget titleBar(BuildContext context, String title) {
    final String buttonTitle = "See all ${title.toLowerCase()}";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => redirectScreen(),
                )
              );*/
            },
            child: Text(
              buttonTitle,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
