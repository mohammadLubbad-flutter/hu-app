import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      //color: const Color.fromRGBO(243, 212, 212, 1),
      height: size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset('images/warning.png'),
            buildWarningmsgBox(size),
            //buildBackButton(),
          ],
        ),
      ),
    );
  }

  Widget buildBackButton() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(onPressed: () {}, child: const Text('Go Back')),
      ),
    );
  }

  Widget buildWarningmsgBox(Size size) {
    return Stack(children: [
      SvgPicture.asset('images/warning1.svg'),
      Positioned(
        bottom: 60,
        left: 5,
        child: SizedBox(
          width: size.width,
          child: const Text(
            'Oops!! Looks Like Something Went Wrong!!',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
        ),
      )
    ]);
  }
}
