part of 'coursessbloc_bloc.dart';

@immutable
abstract class CoursessblocEvent {}

class GetCoursesEvent extends CoursessblocEvent {
  final List coursessnumbers;

  GetCoursesEvent({required this.coursessnumbers});
}

class ChangeColorEvent extends CoursessblocEvent {}

class GetEventsEvent extends CoursessblocEvent {
  final List coursessId;

  GetEventsEvent(this.coursessId);
}
