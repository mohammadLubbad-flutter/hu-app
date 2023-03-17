import 'package:flutter/material.dart';

import 'package:hu/data/model/course_model.dart';

class BuildCoursessCards extends StatelessWidget {
  const BuildCoursessCards(
      {super.key, required this.size, required this.course});
  final Size size;
  final List<CourseModel> course;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: course.length,
        itemBuilder: (context, index) =>
            buildCourseCard(course[index], size, context),
      ),
    );
  }

  buildCourseCard(CourseModel course, Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        color: Theme.of(context).primaryColor,
        elevation: 4,
        child: SizedBox(
          height: size.width * 0.4,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(course.name, Theme.of(context).textTheme.bodyText1,
                    context),
                Row(
                  children: [
                    buildText(course.days,
                        Theme.of(context).textTheme.subtitle1, context),
                    buildText(course.time,
                        Theme.of(context).textTheme.subtitle1, context),
                  ],
                ),
                buildText(course.place, Theme.of(context).textTheme.subtitle1,
                    context),
                buildText(
                    "Notes", Theme.of(context).textTheme.bodyText1, context),
                buildText(course.notes, Theme.of(context).textTheme.subtitle1,
                    context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildText(String text, TextStyle? style, BuildContext context) =>
      Text(text, style: style);
}
