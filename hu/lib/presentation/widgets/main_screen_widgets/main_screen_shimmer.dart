import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/settingsbloc/settings_bloc.dart';

class MainScreenShimmer extends StatelessWidget {
  const MainScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuerysize = MediaQuery.of(context).size;
    return Stack(children: [
      SizedBox(
        height: mediaQuerysize.height,
        width: mediaQuerysize.width,
      ),
      buildBackGroundRedContainer(mediaQuerysize, context),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 4),
        child: Row(
          children: [
            buildUserImageContainer(mediaQuerysize, context),
            SizedBox(
              width: mediaQuerysize.width * 0.01,
            ),
          ],
        ),
      ),
      buildAnnouncmentsContainer(mediaQuerysize, context),
      buildButtonsGridView(mediaQuerysize),
    ]);
  }

  Widget buildButtonsGridView(Size mediaQuerysize) {
    return Padding(
      padding: EdgeInsets.only(
          top: mediaQuerysize.height * 0.6, left: 16, right: 16),
      child: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 5,
            mainAxisExtent: 100),
        itemBuilder: (context, index) => Shimmer(
          gradient: LinearGradient(colors: [
            context.read<SettingsBloc>().darkmode!
                ? const Color.fromRGBO(192, 199, 216, 1)
                : const Color.fromRGBO(206, 112, 115, 0.55),
            context.read<SettingsBloc>().darkmode!
                ? const Color.fromRGBO(77, 95, 140, 1)
                : const Color.fromRGBO(214, 25, 33, 0.55),
          ]),
          child: Card(
            elevation: 4,
            child: Container(
              height: 113,
              width: 128,
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 50,
                    width: 50,
                  ),
                  buildShimmerContainer(15, 100, context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserImageContainer(Size mediaQuerysize, BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [
        context.read<SettingsBloc>().darkmode!
            ? const Color.fromRGBO(192, 199, 216, 1)
            : const Color.fromRGBO(206, 112, 115, 0.55),
        context.read<SettingsBloc>().darkmode!
            ? const Color.fromRGBO(77, 95, 140, 1)
            : const Color.fromRGBO(214, 25, 33, 0.55),
      ]),
      child: Container(
        height: mediaQuerysize.width * 0.1,
        width: mediaQuerysize.width * 0.1,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget buildShimmerContainer(
      double hight, double width, BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [
        context.read<SettingsBloc>().darkmode!
            ? const Color.fromRGBO(192, 199, 216, 1)
            : const Color.fromRGBO(206, 112, 115, 0.55),
        context.read<SettingsBloc>().darkmode!
            ? const Color.fromRGBO(77, 95, 140, 1)
            : const Color.fromRGBO(214, 25, 33, 0.55),
      ]),
      child: Card(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24)),
          height: 15,
          width: width,
        ),
      ),
    );
  }

  Widget buildAnnouncmentsContainer(Size mediaQuerysize, BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [
        context.read<SettingsBloc>().darkmode!
            ? const Color.fromRGBO(192, 199, 216, 1)
            : const Color.fromRGBO(206, 112, 115, 0.55),
        context.read<SettingsBloc>().darkmode!
            ? const Color.fromRGBO(77, 95, 140, 1)
            : const Color.fromRGBO(214, 25, 33, 0.55),
      ]),
      child: Container(
        margin: EdgeInsets.only(top: mediaQuerysize.height * 0.2),
        width: mediaQuerysize.width,
      ),
    );
  }

  Widget buildBackGroundRedContainer(
      Size mediaQuerysize, BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [
        context.read<SettingsBloc>().darkmode!
            ? const Color.fromRGBO(192, 199, 216, 1)
            : const Color.fromRGBO(206, 112, 115, 0.55),
        context.read<SettingsBloc>().darkmode!
            ? const Color.fromRGBO(77, 95, 140, 1)
            : const Color.fromRGBO(214, 25, 33, 0.55),
      ]),
      child: Container(
        width: double.infinity,
        height: mediaQuerysize.height * 0.35,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
      ),
    );
  }
}
