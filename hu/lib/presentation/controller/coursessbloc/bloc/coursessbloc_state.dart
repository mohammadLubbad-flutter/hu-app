part of 'coursessbloc_bloc.dart';

@immutable
abstract class CoursessblocState {}

class CoursessblocInitial extends CoursessblocState {
  final List<CourseModel> coursess;
  final List<EventModel> coursessEvents;
  final RequestState requestState;
  final String errormsg;

  CoursessblocInitial(
      {this.coursess = const [],
      this.requestState = RequestState.loading,
      this.errormsg = '',
      this.coursessEvents = const []});
  CoursessblocInitial copyWith(
      {List<CourseModel>? coursess,
      List<EventModel>? coursessEvents,
      RequestState? requestState,
      String? errormsg}) {
    return CoursessblocInitial(
        coursessEvents: coursessEvents ?? this.coursessEvents,
        coursess: coursess ?? this.coursess,
        errormsg: errormsg ?? this.errormsg,
        requestState: requestState ?? this.requestState);
  }
}
