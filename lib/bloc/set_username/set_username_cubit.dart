import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'set_username_state.dart';

class SetUsernameCubit extends Cubit<SetUsernameState> {
  SetUsernameCubit() : super(SetUsernameInitial());

  void resetState() {
    emit(SetUsernameInitial());
  }

  void setUsername(String name) async {
    emit(SetUsernameLoading());
    final selectedUsername = name;
    emit(SetUsernameLoaded(selectedUsername: selectedUsername));
  }
}
