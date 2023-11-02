part of 'conducts_bloc.dart';

enum ContactsStates { initial, success, failed }

class ContactApp {
  String? displayName;
  String? phones;
  ContactApp({required this.displayName, required this.phones});
}

class ConductsState {
  ContactsStates? status;
  List<ContactApp> contactList = [];
  ConductsState({required this.status});
}
