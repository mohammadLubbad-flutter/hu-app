import 'package:flutter/material.dart';

ThemeData getLigthThemeData() => ThemeData(
    primarySwatch: MaterialColor(const Color.fromRGBO(235, 28, 36, 1).value, {
      50: Colors.red.shade50,
      100: const Color.fromRGBO(235, 28, 36, 1),
      200: Colors.red.shade200,
      300: Colors.red.shade300,
      400: Colors.red.shade400,
      500: Colors.red.shade500,
      600: Colors.red.shade600,
      700: Colors.red.shade700,
      800: Colors.red.shade800,
      900: Colors.red.shade900
    }),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    secondaryHeaderColor: Colors.white,
    primaryColor: const Color.fromRGBO(235, 28, 36, 1),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(235, 28, 36, 1),
    ),
    appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
    textTheme: texttheme(),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: elevatedButtonTheme(),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.white),
      trackColor: MaterialStateProperty.all(
        const Color.fromRGBO(235, 28, 36, 1),
      ),
    ));

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(const TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 10)),
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(235, 28, 36, 1),
          ),
          minimumSize: MaterialStateProperty.all(const Size(144, 48)),
          maximumSize: MaterialStateProperty.all(const Size(144, 48)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17)))));
}

TextTheme texttheme() {
  return const TextTheme(
      headline4: TextStyle(
        //MainScreen UsernameStyle and courseScreen Carddata and grades screen body
        fontFamily: 'Roboto',
        color: Colors.white,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        //settings switchname
        fontFamily: 'Roboto-Regular',
        fontSize: 20,
        color: Color.fromRGBO(235, 28, 36, 1),
      ),
      bodyText1: TextStyle(
        //CourseScreen CardTitles and grades cards titles
        fontFamily: 'Roboto-Bold',
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        //MainScreen UsernameStyle and courseScreen Carddata and grades screen body
        fontFamily: 'PlayFairDisplay',
        color: Colors.white,
        fontSize: 18,
      ),
      headline2: TextStyle(
        //onBordingScreen body
        fontFamily: 'PlayFairDisplay',
        color: Colors.black,
        fontSize: 18,
      ),
      headline3: TextStyle(
        //LoginScreen
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.white,
      ),
      headline5: TextStyle(
        //DatePicker card(dayStyle)
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Color.fromRGBO(235, 28, 36, 1),
      ),
      headline1: TextStyle(
        //onBordingScreen Title
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ));
}
