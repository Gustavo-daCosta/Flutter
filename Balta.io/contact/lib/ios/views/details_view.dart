import 'package:contact/ios/styles.dart';
import 'package:contact/ios/views/address_view.dart';
import 'package:contact/ios/views/editor_contact_view.dart';
import 'package:contact/models/contact_model.dart';
import 'package:flutter/cupertino.dart';

class DetailsView extends StatelessWidget {
  late String contactName;
  late String contactPhoneNumber;
  late String contactEmail;

  DetailsView({
    Key? key,
    required this.contactName,
    required this.contactPhoneNumber,
    required this.contactEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text("Contato"),
            trailing: CupertinoButton(
              child: const Icon(
                CupertinoIcons.pen,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditorContactView(
                      model: ContactModel(
                        id: "1",
                        name: contactName,
                        email: contactEmail,
                        phone: contactPhoneNumber,
                      )
                    ),
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://iili.io/Vkwuje.png"
                        ),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  contactName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  contactPhoneNumber,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  contactEmail,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CupertinoButton(
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.phone
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.mail
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.photo_camera
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            SizedBox(width: double.infinity),
                            Text(
                              "Endereço",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Rua do Desenvolvedor, 256",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Santo André - SP",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const AddressView(),
                            ),
                          );
                        },
                        child: const Icon(
                          CupertinoIcons.location
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}