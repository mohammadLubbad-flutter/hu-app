import 'package:flutter/material.dart';

ThemeData getDarkThemeData() => ThemeData(
    canvasColor: const Color.fromRGBO(39, 40, 45, 100),
    primaryColor: const Color.fromRGBO(120, 139, 189, 100),
    appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
    textTheme: texttheme(),
    elevatedButtonTheme: elevatedButtonTheme(),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(120, 139, 189, 100),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.white),
      trackColor: MaterialStateProperty.all(
        const Color.fromRGBO(120, 139, 189, 100),
      ),
    ));

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(const TextStyle(
              color: Colors.white, fontFamily: 'Roboto-Regular', fontSize: 10)),
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(120, 139, 189, 100),
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
        color: Color.fromRGBO(120, 139, 189, 100),
      ),
      bodyText1: TextStyle(
        //CourseScreen CardTitles and grades cards titles
        fontFamily: 'Roboto-Bold',
        fontSize: 26,
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
        color: Colors.white,
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
        color: Color.fromRGBO(120, 139, 189, 100),
      ),
      headline1: TextStyle(
        //onBordingScreen Title
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.white,
      ));
}
