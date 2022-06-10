import 'package:contact/android/views/details_view.dart';
import 'package:contact/android/views/editor_contact_view.dart';
import 'package:flutter/material.dart';
import 'dart:math' show Random;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarTextStyle: TextStyle(color: Theme.of(context).primaryColorDark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Meus Contatos"),
        actions: [
          TextButton(
            child: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              ListTile(
                title: Text(contactName),
                subtitle: Text(telephoneNumber),
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      image: const DecorationImage(
                          image: NetworkImage(
                        "https://iili.io/Vkwuje.png",
                      ))),
                ),
                trailing: TextButton(
                  child: const Icon(
                    Icons.info_outline,
                    size: 34,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailsView()),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              ListTile(
                title: Text(contactName),
                subtitle: Text(telephoneNumber),
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      image: const DecorationImage(
                          image: NetworkImage(
                        "https://iili.io/XKmrwg.png",
                      ))),
                ),
                trailing: TextButton(
                  child: const Icon(
                    Icons.info_outline,
                    size: 34,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailsView()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.secondary,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditorContactView(),
              ));
        },
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  // var random = Random();
  // String contactName = "Pikachu";
  // String telephoneNumber =
  //     "11 ${random.nextInt(90000) + 10000}-${random.nextInt(9000) + 1000}";
  // String contactEmail = "${contactName.toLowerCase()}@email.com";
  final String iconUrl;
  final String name;
  final String telephoneNumber;

  const ContactItem(
      {Key? key,
      required this.iconUrl,
      required this.name,
      required this.telephoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListTile(
          title: Text(name),
          subtitle: Text(telephoneNumber),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                image: const DecorationImage(
                    image: NetworkImage(
                  "https://iili.io/Vkwuje.png",
                ))),
          ),
          trailing: TextButton(
            child: const Icon(
              Icons.info_outline,
              size: 34,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailsView()),
              );
            },
          ),
        ),
      ],
    );
  }
}
