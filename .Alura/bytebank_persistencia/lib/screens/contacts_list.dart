import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const <Contact>[],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text(
                      "Loading",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              );
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact: contact);
                },
                itemCount: contacts.length,
              );
            default:
              return const Text("Unknow error");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          )
              .then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(contact.name),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red.withOpacity(0.9),
        child: const Icon(Icons.delete),
      ),
      child: Card(
        child: ListTile(
          title: Text(
            contact.name,
            style: const TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            contact.accountNumber.toString(),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
