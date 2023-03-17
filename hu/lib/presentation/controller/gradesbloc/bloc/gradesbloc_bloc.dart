import 'package:bloc/bloc.dart';
import 'package:hu/core/enums/bloc_enums.dart';
import 'package:hu/data/model/grades_model.dart';
import 'package:hu/domain/usecases/get_student_grades.dart';
import 'package:hu/presentation/controller/mainScreen/bloc/mainscreenbloc_bloc.dart';
import 'package:meta/meta.dart';

part 'gradesbloc_event.dart';
part 'gradesbloc_state.dart';

class GradesblocBloc extends Bloc<GradesblocEvent, GradesblocInitial> {
  final GetStudentGradesUsecase getStudentGradesUsecase;

  GradesblocBloc(
    this.getStudentGradesUsecase,
  ) : super(GradesblocInitial()) {
    on<GetStudentGradesEvent>((event, emit) async {
      try {
        final res =
            await getStudentGradesUsecase.call(GradesParameters(event.id));
        emit(state.copyWith(
          gradesModel: res,
          requestState: RequestState.loaded,
        ));
      } catch (e) {
        emit(state.copyWith(
          errormsg: e.toString(),
          requestState: RequestState.error,
        ));
      }
    });
  }
}
