import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hu/core/enums/bloc_enums.dart';
import 'package:hu/data/model/course_model.dart';
import 'package:hu/data/model/student_model.dart';
import 'package:hu/domain/usecases/get_course_info_usecase.dart';
import 'package:hu/domain/usecases/get_student_info_usecase.dart';
import 'package:meta/meta.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'mainscreenbloc_event.dart';
part 'mainscreenbloc_state.dart';

class MainscreenblocBloc
    extends Bloc<MainscreenblocEvent, MainscreenblocInitial> {
  final GetStudentInfoUsecase getStudentInfoUsecase;
  StudentModel? studentModel;
  String? userOneSignalId;

  MainscreenblocBloc(this.getStudentInfoUsecase)
      : super(MainscreenblocInitial()) {
    on<GetUserInfoEvent>(getUserInfo);
  }

  getUserInfo(event, emit) async {
    OneSignal.shared.getDeviceState().then((value) {
      userOneSignalId = value!.userId.toString();
    });
    try {
      final res = studentModel =
          await getStudentInfoUsecase.call(StudentParameter(id: event.id));
      emit(state.copyWith(
        studentModel: res,
        studentrequestState: RequestState.loaded,
      ));
      print(studentModel);
      OneSignal.shared.postNotification(OSCreateNotification(
          playerIds: [userOneSignalId.toString()],
          content: 'Welcome To Hu App',
          subtitle: 'Welcoming Notification'));
    } catch (e) {
      print(e);
      emit(state.copyWith(
        studenterrormsg: e.toString(),
        studentrequestState: RequestState.error,
      ));
    }
  }
}
