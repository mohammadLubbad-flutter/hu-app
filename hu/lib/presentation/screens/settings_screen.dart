import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hu/presentation/controller/settingsbloc/settings_bloc.dart';

import 'package:hu/presentation/screens/main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
      ),
      body: Column(
        children: [
          buildSwitchButton(
              AppLocalizations.of(context)!.darkModeSw, bloc.darkmode!, (val) {
            context.read<SettingsBloc>().add(ChangeSwitchValue('Dark Mode'));
          }, context),
          buildSwitchButton(
              AppLocalizations.of(context)!.arabicLangSw, bloc.arabic!, (val) {
            context
                .read<SettingsBloc>()
                .add(ChangeSwitchValue('Arabic Language'));
          }, context),
          buildSwitchButton(AppLocalizations.of(context)!.notificationsSw,
              bloc.notifications!, (val) {
            context
                .read<SettingsBloc>()
                .add(ChangeSwitchValue('Notifications'));
          }, context)
        ],
      ),
    );
  }

  Widget buildSwitchButton(String label, bool value,
      void Function(bool)? onChange, BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsInitial>(
        builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Switch(
              inactiveTrackColor: Colors.grey,
              activeColor: Theme.of(context).primaryColor,
              thumbColor: MaterialStateProperty.all(
                  Theme.of(context).secondaryHeaderColor),
              value: label == "Dark Mode"
                  ? state.dark
                  : label == 'Arabic Language'
                      ? state.arabic
                      : state.notifications,
              onChanged: onChange),
        ],
      );
    });
  }
}
