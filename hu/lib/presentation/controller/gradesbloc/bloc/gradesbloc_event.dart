part of 'gradesbloc_bloc.dart';

@immutable
abstract class GradesblocEvent {}

class GetStudentGradesEvent extends GradesblocEvent {
  final String id;

  GetStudentGradesEvent(this.id);
}
