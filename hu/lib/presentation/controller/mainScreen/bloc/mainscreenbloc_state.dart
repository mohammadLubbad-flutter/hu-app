part of 'mainscreenbloc_bloc.dart';

@immutable
abstract class MainscreenblocState {}

class MainscreenblocInitial extends MainscreenblocState {
  final StudentModel? studentModel;

  final RequestState studentrequestState;

  final String studenterrormsg;

  MainscreenblocInitial(
      {this.studentModel,
      this.studentrequestState = RequestState.loading,
      this.studenterrormsg = ''});
  MainscreenblocInitial copyWith({
    StudentModel? studentModel,
    List<CourseModel>? coursess,
    RequestState? studentrequestState,
    RequestState? coursessrequestState,
    String? studenterrormsg,
    String? coursesserrormsg,
  }) {
    return MainscreenblocInitial(
      studentModel: studentModel ?? this.studentModel,
      studentrequestState: studentrequestState ?? this.studentrequestState,
      studenterrormsg: studenterrormsg ?? this.studenterrormsg,
    );
  }
}
