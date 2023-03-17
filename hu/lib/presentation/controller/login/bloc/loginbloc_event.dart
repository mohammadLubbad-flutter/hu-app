part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocEvent {}

class LoginEvent extends LoginblocEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class LoginSaveVarsEvent extends LoginblocEvent {
  final TextEditingController ctrl;
  String val;

  LoginSaveVarsEvent({required this.ctrl, required this.val});
}
