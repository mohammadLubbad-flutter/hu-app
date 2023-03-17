import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hu/core/enums/bloc_enums.dart';
import 'package:hu/core/servicelocator/service_locator.dart';
import 'package:hu/data/model/grades_model.dart';
import 'package:hu/presentation/controller/gradesbloc/bloc/gradesbloc_bloc.dart';

import 'package:hu/presentation/screens/error_screen.dart';

import 'package:hu/presentation/screens/main_screen.dart';
import 'package:hu/presentation/widgets/grades_screen_widgets/grades_screen_shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});
  static const routename = '/gradesscreen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final id = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocProvider<GradesblocBloc>(
        create: (context) =>
            GradesblocBloc(sl())..add(GetStudentGradesEvent(id.toString())),
        child: BlocBuilder<GradesblocBloc, GradesblocInitial>(
          builder: (context, state) {
            if (state.requestState == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) =>
                    buildSubjectCard(state.gradesModel[index], context, size),
                itemCount: state.gradesModel.length,
              );
            }
            if (state.requestState == RequestState.loading) {
              return const GradesScreenShimmer();
            } else {
              return const ErrorScreen();
            }
          },
        ),
      ),
    );
  }

  Widget buildSubjectCard(
      GradesModel gradesModel, BuildContext context, Size size) {
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(17),
        ),
        height: size.height * 0.2,
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gradesModel.course,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            buildTextsRow(AppLocalizations.of(context)!.midTerm,
                gradesModel.midTerm, context),
            buildTextsRow(AppLocalizations.of(context)!.assignment,
                gradesModel.assignment, context),
            buildTextsRow(AppLocalizations.of(context)!.finalExam,
                gradesModel.finalExam, context),
          ],
        ),
      ),
    );
  }

  Widget buildTextsRow(String text1, double mark, BuildContext context) {
    return Row(
      children: [
        buildsubTexts(text1, context),
        buildsubTexts(mark, context),
      ],
    );
  }

  Widget buildsubTexts(var text, BuildContext context) => Text(
        '$text',
        style: Theme.of(context).textTheme.subtitle1,
      );

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ));
        },
      ),
    );
  }
}
