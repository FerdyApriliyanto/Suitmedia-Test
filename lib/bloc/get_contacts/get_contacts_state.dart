part of 'get_contacts_cubit.dart';

sealed class GetContactsState extends Equatable {
  const GetContactsState();

  @override
  List<Object> get props => [];
}

final class GetContactsInitial extends GetContactsState {}

final class GetContactsLoading extends GetContactsState {
  final List<ContactModel>? oldContactsData;
  final bool isFirstFetch;

  const GetContactsLoading(this.oldContactsData, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldContactsData!, isFirstFetch];
}

final class GetContactsLoaded extends GetContactsState {
  final List<ContactModel> contacts;

  const GetContactsLoaded({required this.contacts});

  @override
  List<Object> get props => [contacts];
}
