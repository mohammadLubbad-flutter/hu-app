import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hu/core/enums/bloc_enums.dart';

import 'package:hu/presentation/controller/login/bloc/loginbloc_bloc.dart';
import 'package:hu/presentation/controller/settingsbloc/settings_bloc.dart';
import 'package:hu/presentation/screens/main_screen.dart';
import 'package:hu/presentation/screens/on_boarding_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Screen loginnnnnnnnnnnnn');
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Stack(children: [
          SizedBox(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Image.asset(
              'images/login_background.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            color: Colors.black.withOpacity(0.52),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                buildLoginText(deviceSize, context),
                buildHuLogo(),
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        buildTextFormField(Icons.person, (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return AppLocalizations.of(context)!.invalidEmail;
                          }
                          return null;
                        },
                            context,
                            BlocProvider.of<LoginblocBloc>(context).emailctrl,
                            context),
                        buildTextFormField(Icons.lock, (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return AppLocalizations.of(context)!
                                .invalidPassword;
                          }
                        },
                            context,
                            BlocProvider.of<LoginblocBloc>(context)
                                .passwordctrl,
                            context)
                      ],
                    )),
                const SizedBox(
                  height: 100,
                ),
                buildButtonsRow(context)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildLoginText(Size deviceSize, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: deviceSize.height * 0.1),
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.screenTitle,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }

  Widget buildHuLogo() {
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 99),
          height: 157,
          width: 144,
          child: Image.asset(
            'images/hu.jpg',
            fit: BoxFit.fill,
          )),
    );
  }

  Widget buildButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buildBackButton(context),
        const SizedBox(
          width: 15,
        ),
        BlocBuilder<LoginblocBloc, LoginblocInitial>(
          builder: (context, state) {
            if (state.requestState == RequestState.loading) {
              return const CircularProgressIndicator();
            } else if (state.requestState == RequestState.loaded) {
              return ElevatedButton(
                onPressed: () async {
                  formkey.currentState!.save();

                  BlocProvider.of<LoginblocBloc>(context).add(LoginEvent(
                      BlocProvider.of<LoginblocBloc>(context).emailctrl.text,
                      BlocProvider.of<LoginblocBloc>(context)
                          .passwordctrl
                          .text));
                  if (state.auth == true) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ));
                  } else if (state.auth == false) {
                    showErrorSnackBar(
                        AppLocalizations.of(context)!.errorLogin, context);
                  }
                },
                child: Text(AppLocalizations.of(context)!.loginBtn),
              );
            } else {
              return showErrorSnackBar(state.errormsg, context);
            }
          },
        ),
      ],
    );
  }

  showErrorSnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17), topRight: Radius.circular(17))),
        backgroundColor: Colors.white,
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(235, 28, 36, 100),
          ),
        ),
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(17)),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(AppLocalizations.of(context)!.backBtn),
      ),
    );
  }

  Widget buildTextFormField(IconData icon, String? Function(String?)? valid,
      BuildContext ctx, TextEditingController ctrl, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          Expanded(
            child: TextFormField(
              textDirection: context.read<SettingsBloc>().arabic!
                  ? TextDirection.ltr
                  : TextDirection.ltr,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
              controller: ctrl,
              onSaved: (newValue) {
                BlocProvider.of<LoginblocBloc>(context)
                    .add(LoginSaveVarsEvent(ctrl: ctrl, val: newValue!));
              },
              validator: valid,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}
