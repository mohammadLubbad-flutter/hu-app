import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shimmer/shimmer.dart';

import '../../controller/settingsbloc/settings_bloc.dart';

class DateShimmer extends StatelessWidget {
  const DateShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildCardShimmer(context),
        buildCardShimmer(context),
        buildCardShimmer(context),
        buildCardShimmer(context),
      ],
    );
  }

  Padding buildCardShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
      ),
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
          elevation: 4,
          child: SizedBox(
              height: 104,
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextShimmer(70, context),
                  buildTextShimmer(40, context),
                  buildTextShimmer(40, context),
                ],
              )),
        ),
      ),
    );
  }

  Shimmer buildTextShimmer(double width, BuildContext context) {
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17), color: Colors.white),
        margin: const EdgeInsets.all(8),
        height: 15,
        width: width,
      ),
    );
  }
}
