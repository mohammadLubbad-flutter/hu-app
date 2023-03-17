part of 'gradesbloc_bloc.dart';

@immutable
abstract class GradesblocState {}

class GradesblocInitial extends GradesblocState {
  final List<GradesModel> gradesModel;
  final RequestState requestState;
  final String errormsg;

  GradesblocInitial(
      {this.gradesModel = const [],
      this.requestState = RequestState.loading,
      this.errormsg = ''});
  GradesblocInitial copyWith({
    List<GradesModel>? gradesModel,
    RequestState? requestState,
    String? errormsg,
  }) {
    return GradesblocInitial(
      gradesModel: gradesModel ?? this.gradesModel,
      requestState: requestState ?? this.requestState,
      errormsg: errormsg ?? this.errormsg,
    );
  }
}
