import 'package:bloc/bloc.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:meta/meta.dart';

part 'conducts_event.dart';
part 'conducts_state.dart';

class ConductsBloc extends Bloc<ConductsEvent, ConductsState> {
  ConductsBloc() : super(ConductsState(status: ContactsStates.initial)) {
    on<GetContactEvent>((event, emit) async {
      print('print1');

      List<Contact> contacts = await FlutterContacts.getContacts();
      print(contacts);
      ConductsState conductsState =
          ConductsState(status: ContactsStates.success);

      for (Contact contact in contacts) {
        conductsState.contactList.add(
          ContactApp(
              displayName: contact.displayName.toString(),
              phones: contact.phones.toString()),
        );
        orElse:
        () => print('No matching element.');
      }

      emit(conductsState);

      // TODO: implement event handler
    });
  }
}
