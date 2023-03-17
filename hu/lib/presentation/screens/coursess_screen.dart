import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hu/core/enums/bloc_enums.dart';
import 'package:hu/core/servicelocator/service_locator.dart';

import 'package:hu/core/utils/datetime/date_time.dart';
import 'package:hu/data/model/event_model.dart';
import 'package:hu/data/model/student_model.dart';

import 'package:hu/presentation/screens/error_screen.dart';
import 'package:hu/presentation/screens/main_screen.dart';

import 'package:hu/presentation/widgets/coursess_screen_widgets/build_coursess_cards.dart';

import '../controller/coursessbloc/bloc/coursessbloc_bloc.dart';
import '../widgets/coursess_screen_widgets/course_card_shimmer.dart';
import '../widgets/coursess_screen_widgets/date_shimmer.dart';

class CoursessScreen extends StatelessWidget {
  const CoursessScreen({super.key});
  static const rotename = 'coursessscreen';

  @override
  Widget build(BuildContext context) {
    final student = ModalRoute.of(context)!.settings.arguments as StudentModel;
    final mediaQuerySize = MediaQuery.of(context).size;

    for (var i = 0; i < 91; i++) {
      daysList.add(DateTime.now().add(Duration(days: i)).day);
      mounthsList.add(DateTime.now().add(Duration(days: i)).month);
    }

    return Scaffold(
      body: BlocProvider<CoursessblocBloc>(
        create: (context) => CoursessblocBloc(sl(), sl())
          ..add(GetCoursesEvent(coursessnumbers: student.coursessId))
          ..add(GetEventsEvent(student.coursessId)),
        child: BlocBuilder<CoursessblocBloc, CoursessblocInitial>(
          builder: (context, state) {
            if (state.requestState == RequestState.loading) {
              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: const [DateShimmer(), CourseCardShimmer()],
                ),
              );
            } else if (state.requestState == RequestState.loaded) {
              return buildLoadedScreen(
                  mediaQuerySize, context, state.coursessEvents, state);
            } else {
              return const ErrorScreen();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoadedScreen(Size mediaQuerySize, BuildContext context,
      List<EventModel> events, CoursessblocInitial state) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: mediaQuerySize.width * 0.05),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
        buildDateTimeLine(mediaQuerySize, events),
        BuildCoursessCards(
          size: mediaQuerySize,
          course: state.coursess,
        )
      ],
    );
  }

  Widget buildDateTimeLine(Size mediaQuerySize, List<EventModel> events) {
    return SizedBox(
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: daysList.length,
            itemBuilder: (context, index) {
              return buildDateCard(index, events, context);
            }));
  }
}

Widget buildDateCard(int index, List<EventModel> events, BuildContext context) {
  //getEvent index so we can reach it in the event list
  final eventindex = events.indexWhere((element) =>
      element.day == daysList[index] && element.month == mounthsList[index]);
  String event = 'None';
  String subject = '';
  //check if there is an event for the day (by matching evetn date with day date)if found get the event if not make it no event(none)
  if (events.indexWhere((element) =>
          element.day == daysList[index] &&
          element.month == mounthsList[index]) >=
      0) {
    //to set the note in the specefic day
    event = events[eventindex].event;
    subject = events[eventindex].subject;
  }

  return buildCard(context, index, event, subject);
}

Widget buildCard(
    BuildContext context, int index, String event, String subject) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 4,
    ),
    child: Card(
      color: daysList[index] == DateTime.now().day &&
              mounthsList[index] == DateTime.now().month
          ? Theme.of(context).primaryColor
          : Colors.white,
      elevation: 4,
      child: SizedBox(
        height: 104,
        width: 80,
        child: buildTextsColumn(index, context, subject, event),
      ),
    ),
  );
}

Widget buildTextsColumn(
    int index, BuildContext context, String subject, String event) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildDayText(index, context),
      buildText(
          getMounthName(int.parse(mounthsList[index].toString())),
          index,
          daysList[index] == DateTime.now().day &&
                  mounthsList[index] == DateTime.now().month
              ? Colors.white
              : Colors.grey,
          context),
      buildText(
          subject,
          index,
          daysList[index] == DateTime.now().day &&
                  mounthsList[index] == DateTime.now().month
              ? Colors.white
              : subject != ''
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
          context),
      buildText(
          event,
          index,
          daysList[index] == DateTime.now().day &&
                  mounthsList[index] == DateTime.now().month
              ? Colors.white
              : event != 'None'
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
          context),
    ],
  );
}

Widget buildDayText(int index, BuildContext context) {
  return Text(
    daysList[index].toString(),
    style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: daysList[index] == DateTime.now().day &&
              mounthsList[index] == DateTime.now().month
          ? Colors.white
          : Theme.of(context).primaryColor,
    ),
  );
}

Widget buildText(String title, int index, Color color, BuildContext context) {
  return Expanded(
    child: Text(
      title,
      style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: color),
    ),
  );
}
