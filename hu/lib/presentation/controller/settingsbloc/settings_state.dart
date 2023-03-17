part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final bool dark;
  final bool arabic;
  final bool notifications;

  SettingsInitial(
      {this.arabic = false, this.notifications = false, this.dark = false});
  SettingsInitial copyWith({
    bool? dark,
    bool? arabic,
    bool? notifications,
  }) {
    return SettingsInitial(
        dark: dark ?? this.dark,
        arabic: arabic ?? this.arabic,
        notifications: notifications ?? this.notifications);
  }
}
