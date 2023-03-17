import 'package:get_it/get_it.dart';
import 'package:hu/data/data%20source/data_source.dart';
import 'package:hu/data/reposetiry/reposetiry.dart';
import 'package:hu/domain/reposetiry/base_reposetiry.dart';
import 'package:hu/domain/usecases/authintication_usecase.dart';
import 'package:hu/domain/usecases/get_course_info_usecase.dart';
import 'package:hu/domain/usecases/get_events_usecase.dart';
import 'package:hu/domain/usecases/get_student_grades.dart';
import 'package:hu/domain/usecases/get_student_info_usecase.dart';
import 'package:hu/presentation/controller/coursessbloc/bloc/coursessbloc_bloc.dart';
import 'package:hu/presentation/controller/gradesbloc/bloc/gradesbloc_bloc.dart';
import 'package:hu/presentation/controller/login/bloc/loginbloc_bloc.dart';
import 'package:hu/presentation/controller/mainScreen/bloc/mainscreenbloc_bloc.dart';
import 'package:hu/presentation/controller/settingsbloc/settings_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<LoginblocBloc>(() => LoginblocBloc(sl()));
    sl.registerLazySingleton<GradesblocBloc>(() => GradesblocBloc(sl()));
    sl.registerLazySingleton<CoursessblocBloc>(
        () => CoursessblocBloc(sl(), sl()));
    sl.registerLazySingleton<MainscreenblocBloc>(() => MainscreenblocBloc(
          sl(),
        ));
    sl.registerLazySingleton<SettingsBloc>(() => SettingsBloc());
    sl.registerLazySingleton<GetEventsUsecase>(() => GetEventsUsecase(sl()));
    sl.registerLazySingleton<AuthinticationUseCase>(
        () => AuthinticationUseCase(sl()));
    sl.registerLazySingleton<GetStudentGradesUsecase>(
        () => GetStudentGradesUsecase(sl()));
    sl.registerLazySingleton<GetCourseInfoUsecase>(
        () => GetCourseInfoUsecase(sl()));
    sl.registerLazySingleton<GetStudentInfoUsecase>(
        () => GetStudentInfoUsecase(sl()));
    sl.registerLazySingleton<BaseReposetiry>(() => Reposetiry(sl()));
    sl.registerLazySingleton<BaseDataSource>(() => DataSource());
  }
}
