part of 'set_username_cubit.dart';

sealed class SetUsernameState extends Equatable {
  const SetUsernameState();

  @override
  List<Object> get props => [];
}

final class SetUsernameInitial extends SetUsernameState {}

final class SetUsernameLoading extends SetUsernameState {}

final class SetUsernameLoaded extends SetUsernameState {
  final String selectedUsername;

  const SetUsernameLoaded({required this.selectedUsername});

  @override
  List<Object> get props => [selectedUsername];
}
