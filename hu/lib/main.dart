import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hu/core/App%20Theme/dark_theme.dart/dark_theme.dart';
import 'package:hu/domain/usecases/get_events_usecase.dart';

import 'package:hu/presentation/controller/login/bloc/loginbloc_bloc.dart';
import 'package:hu/presentation/controller/settingsbloc/settings_bloc.dart';
import 'package:hu/presentation/screens/coursess_screen.dart';
import 'package:hu/presentation/screens/grades_screen.dart';
import 'package:hu/presentation/screens/on_boarding_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'core/App Theme/light theme/light_theme.dart';
import 'core/servicelocator/service_locator.dart';
import 'core/utils/localization/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  //2052a85c-f593-45ff-a0c1-181810863301
  WidgetsFlutterBinding.ensureInitialized();
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("2052a85c-f593-45ff-a0c1-181810863301");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  await Firebase.initializeApp();
  ServiceLocator().init();
  GetEventsUsecase(sl()).call(EventParameters([1, 2]));
  final pref = await SharedPreferences.getInstance();
  OneSignal.shared
      .disablePush(pref.getBool('Notifications') == true ? false : true);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginblocBloc(sl()),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(
            arabic: pref.getBool('Arabic') ?? false,
            darkmode: pref.getBool('Dark') ?? false,
            notifications: pref.getBool('Notifications') ?? true,
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsInitial>(
      builder: (context, state) {
        return MaterialApp(
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          locale:
              context.read<SettingsBloc>().arabic! ? L10n.all[1] : L10n.all[0],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: context.read<SettingsBloc>().darkmode!
              ? getDarkThemeData()
              : getLigthThemeData(),
          home: const OnBoardingScreen(),
          routes: {
            CoursessScreen.rotename: (context) => const CoursessScreen(),
            GradesScreen.routename: (context) => const GradesScreen(),
          },
        );
      },
    );
  }
}
