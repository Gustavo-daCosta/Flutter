import 'package:contact/android/views/address.view.dart';
import 'package:contact/android/views/editor_contact_view.dart';
import 'package:contact/android/views/home_view.dart';
import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(200),
            ),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: NetworkImage("https://iili.io/Vkwuje.png"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            contactName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            telephoneNumber,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            contactEmail,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all(
                    const CircleBorder(
                      side: BorderSide.none
                    ),
                  ),
                ),
                child: Icon(
                  Icons.phone,
                  size: 30,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all(
                    const CircleBorder(
                      side: BorderSide.none
                    ),
                  ),
                ),
                child: Icon(
                  Icons.email,
                  size: 30,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all(
                    const CircleBorder(
                      side: BorderSide.none
                    ),
                  ),
                ),
                child: Icon(
                  //Icons.photo,
                  Icons.camera_enhance,
                  size: 30,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40,),
          ListTile(
            isThreeLine: true,
            title: const Text(
              "Endereço",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Rua do Desenvolvedor, 256",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Santo André - SP",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddressView(),
                  )
                );
              },
              child: Icon(
                Icons.pin_drop,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorContactView(
                model: ContactModel(
                  id: "1",
                  name: contactName,
                  email: contactEmail,
                  phone: telephoneNumber,
                ),
              ),
            )
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.edit,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}