import 'package:bytebank/components/container.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ContactsListState {
  const ContactsListState();
}

@immutable
class InitContactsListState extends ContactsListState {
  const InitContactsListState();
}

@immutable
class LoadingContactsListState extends ContactsListState {
  const LoadingContactsListState();
}

@immutable
class LoadedContactsListState extends ContactsListState {
  final List<Contact> _contacts;

  const LoadedContactsListState(this._contacts);
}

@immutable
class FatalErrorContactsListState extends ContactsListState {
  const FatalErrorContactsListState();
}

class ContactsListCubit extends Cubit<ContactsListState> {
  ContactsListCubit() : super(const InitContactsListState());
  
  void reload(ContactDao _dao) {
    // Se está rodando em paralelo, trocar estado para Loading
    emit(const LoadingContactsListState());
    _dao.findAll().then((contacts) => emit(LoadedContactsListState(contacts)));
  }
}

class ContactsListContainer extends BlocContainer {
  const ContactsListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactDao dao = ContactDao();
    return BlocProvider<ContactsListCubit>(
      create: (BuildContext context) {
        final cubit = ContactsListCubit();
        cubit.reload(dao);
        return cubit;
      },
      child: ContactsList(dao),
    );
  }
}

class ContactsList extends StatelessWidget {
  final ContactDao dao;

  const ContactsList(
    this.dao,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer"),
      ),
      body: BlocBuilder<ContactsListCubit, ContactsListState>(
        builder: (context, state) {
          if (state is InitContactsListState || state is LoadingContactsListState) {
            return const Progress();
          }
          if (state is LoadedContactsListState) {
            final List<Contact> contacts = state._contacts;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];
                return _ContactItem(
                  contact: contact,
                  onClick: () => push(context, TransactionFormContainer(contact)),
                );
              },
              itemCount: contacts.length,
            );
          }
          return const Text("Unkwnow error");
        },
      ),
      floatingActionButton: buildAddContactButton(context),
    );
  }

  FloatingActionButton buildAddContactButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => const ContactForm(),
          ),
        );
        update(context);
      },
      child: const Icon(Icons.add),
    );
  }
  void update(BuildContext context) {
    context.read<ContactsListCubit>().reload(dao);
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const _ContactItem({
    Key? key,
    required this.contact,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
