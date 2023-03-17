part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocState {}

class LoginblocInitial extends LoginblocState {
  final RequestState requestState;
  final String notAuthintecatedmsg;
  final bool? auth;
  final String errormsg;
  LoginblocInitial(
      {this.requestState = RequestState.loaded,
      this.errormsg = '',
      this.auth,
      this.notAuthintecatedmsg = ''});
  LoginblocInitial copyWith({
    RequestState? requestState,
    bool? auth,
    String? notAuthintecatedmsg,
    String? errormsg,
  }) {
    return LoginblocInitial(
      auth: auth ?? this.auth,
      requestState: requestState ?? this.requestState,
      errormsg: errormsg ?? this.errormsg,
      notAuthintecatedmsg: notAuthintecatedmsg ?? this.notAuthintecatedmsg,
    );
  }
}
