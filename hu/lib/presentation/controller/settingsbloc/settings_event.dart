part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class ChangeSwitchValue extends SettingsEvent {
  final String switchName;

  ChangeSwitchValue(
    this.switchName,
  );
}
