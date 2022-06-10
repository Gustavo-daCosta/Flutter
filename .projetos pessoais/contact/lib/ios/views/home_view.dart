import 'package:contact/ios/styles.dart';
import 'package:contact/ios/views/details_view.dart';
import 'package:contact/ios/views/editor_contact_view.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' show Random;

var random = Random();
String contactName = "Pikachu";
String telephoneNumber = "11 ${random.nextInt(90000) + 10000}-${random.nextInt(9000) + 1000}";
String contactEmail = "${contactName.toLowerCase()}@email.com";

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text("Meus Contatos"),
            trailing: CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const EditorContactView(),
                  ),
                );
              },
              child: const Icon(
                CupertinoIcons.add,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                    placeholder: "Pesquisar...",
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://iili.io/Vkwuje.png"
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(48)
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      contactName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      telephoneNumber,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => DetailsView(
                                      contactName: contactName,
                                      contactPhoneNumber: telephoneNumber,
                                      contactEmail: contactEmail,
                                    )
                                  )
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.info_circle_fill,
                                color: primaryColor,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}