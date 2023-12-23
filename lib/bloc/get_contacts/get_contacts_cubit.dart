import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/models/contact_model.dart';
import 'package:suitmedia_test/repositories/contact_repo.dart';

part 'get_contacts_state.dart';

class GetContactsCubit extends Cubit<GetContactsState> {
  GetContactsCubit() : super(GetContactsInitial());
  final _contactRepo = ContactRepo();
  int page = 1;

  void resetState() async {
    page = 1;
    emit(GetContactsInitial());
  }

  Future<void> getContacts() async {
    if (state is GetContactsLoading) return;

    final currentState = state;

    var oldContacts = <ContactModel>[];
    if (currentState is GetContactsLoaded) {
      oldContacts = currentState.contacts;
    }

    emit(GetContactsLoading(oldContacts, isFirstFetch: page == 1));

    await _contactRepo
        .getContacts(page: page.toString())
        .then((newContactsData) {
      page++;

      final contacts = (state as GetContactsLoading).oldContactsData;
      contacts!.addAll(newContactsData);

      emit(GetContactsLoaded(contacts: contacts));
    });
  }
}
