import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsInitial> {
  bool? darkmode;
  bool? arabic;
  bool? notifications;

  SettingsBloc({this.arabic, this.darkmode, this.notifications})
      : super(SettingsInitial()) {
    on<ChangeSwitchValue>((event, emit) async {
      final pref = await SharedPreferences.getInstance();
      switch (event.switchName) {
        case 'Dark Mode':
          darkmode = !darkmode!;
          emit(state.copyWith(dark: darkmode));
          pref.setBool('Dark', darkmode!);

          break;
        case 'Arabic Language':
          arabic = !arabic!;
          emit(state.copyWith(arabic: arabic));
          pref.setBool('Arabic', arabic!);
          break;

        default:
          notifications = !notifications!;
          OneSignal.shared.disablePush(notifications!);
          emit(state.copyWith(notifications: notifications));
          pref.setBool('Notifications', notifications!);
      }
    });
  }
}
