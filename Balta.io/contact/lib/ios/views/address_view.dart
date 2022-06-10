import 'package:contact/ios/styles.dart';
import 'package:flutter/cupertino.dart';

class AddressView extends StatelessWidget {
  const AddressView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text("Endereço"),
            trailing: CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.location,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Endereço atual",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Rua do Desenvolvedor, 256",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Santo André - SP",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: CupertinoTextField(
                    placeholder: "Pesquisar...",
                  ),
                ),
                Expanded(
                  child: Container(
                    color: primaryColor.withOpacity(0.2),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}