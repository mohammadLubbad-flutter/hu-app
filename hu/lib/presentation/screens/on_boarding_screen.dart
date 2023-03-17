import 'package:flutter/material.dart';
import 'package:hu/presentation/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHuLogo(size),
            buildTitleText(context),
            buildBodyText(context),
            buildContinueButton(size, context)
          ],
        ),
      ),
    );
  }

  Widget buildContinueButton(double size, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: size),
      child: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            maximumSize: MaterialStateProperty.all(const Size(327, 48)),
            minimumSize: MaterialStateProperty.all(const Size(327, 48)),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          },
          child: Text(AppLocalizations.of(context)!.continueBtn),
        ),
      ),
    );
  }

  Widget buildBodyText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        AppLocalizations.of(context)!.visionBody,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget buildTitleText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        AppLocalizations.of(context)!.visionTitle,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget buildHuLogo(double size) {
    return Padding(
      padding: EdgeInsets.only(top: size * 0.5),
      child: Center(
        child: Container(
          height: 157,
          width: 144,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('images/hu.jpg'), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
