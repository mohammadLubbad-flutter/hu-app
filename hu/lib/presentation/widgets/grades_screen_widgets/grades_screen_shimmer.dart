import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/settingsbloc/settings_bloc.dart';

class GradesScreenShimmer extends StatelessWidget {
  const GradesScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        buildShimmer(size, context),
        buildShimmer(size, context),
        buildShimmer(size, context),
      ],
    );
  }

  Padding buildShimmer(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: Shimmer(
        gradient: LinearGradient(colors: [
          context.read<SettingsBloc>().darkmode!
              ? const Color.fromRGBO(192, 199, 216, 1)
              : const Color.fromRGBO(206, 112, 115, 0.55),
          context.read<SettingsBloc>().darkmode!
              ? const Color.fromRGBO(77, 95, 140, 1)
              : const Color.fromRGBO(214, 25, 33, 0.55),
        ]),
        child: Card(
          color: const Color.fromRGBO(214, 25, 33, 0.55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          //color: Theme.of(context).primaryColor,
          elevation: 4,
          child: SizedBox(
            height: size.height * 0.20,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildShimmerContainer(15, size.width * 0.5, context),
                  Row(
                    children: [
                      buildShimmerContainer(15, size.width * 0.65, context)
                    ],
                  ),
                  buildShimmerContainer(15, size.width * 0.65, context),
                  buildShimmerContainer(15, size.width * 0.5, context),
                  buildShimmerContainer(15, size.width * 0.65, context)
                ],
              ),
            ),
          ),
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
}
