import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hu/core/enums/bloc_enums.dart';
import 'package:hu/domain/usecases/authintication_usecase.dart';
import 'package:meta/meta.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocInitial> {
  final AuthinticationUseCase authinticationUseCase;
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();
  final String id = '1837834';
  int pagenumber = 0;

  LoginblocBloc(this.authinticationUseCase) : super(LoginblocInitial()) {
    on<LoginEvent>(loginEvent);
    on<LoginSaveVarsEvent>(
      (event, emit) {
        event.ctrl.text = event.val;
        print(event.ctrl.text);
      },
    );
  }

  FutureOr<void> loginEvent(event, emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      final res = await authinticationUseCase
          .call(AuthParameters(event.email, event.password));
      emit(state.copyWith(
          requestState: RequestState.loaded,
          auth: res,
          notAuthintecatedmsg:
              res == true ? '' : 'Password Or Id Wrong Check And Try Aggain'));
    } catch (e) {
      emit(state.copyWith(
        requestState: RequestState.error,
        errormsg: e.toString(),
        auth: false,
      ));
    }
  }

  saveValues(String varr1, String varr2) {
    varr1 = varr2;
    print(varr1);
  }
}
