import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hu/data/model/course_model.dart';
import 'package:hu/data/model/event_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/enums/bloc_enums.dart';
import '../../../../domain/usecases/get_course_info_usecase.dart';
import '../../../../domain/usecases/get_events_usecase.dart';

part 'coursessbloc_event.dart';
part 'coursessbloc_state.dart';

class CoursessblocBloc extends Bloc<CoursessblocEvent, CoursessblocInitial> {
  final GetCourseInfoUsecase getCourseInfoUsecase;
  final GetEventsUsecase getEventsUsecase;
  Color color = Colors.white;
  CoursessblocBloc(this.getCourseInfoUsecase, this.getEventsUsecase)
      : super(CoursessblocInitial()) {
    on<GetCoursesEvent>(
      (event, emit) async {
        print('ggggggggggggggggggggggggggg');
        try {
          final res = await getCourseInfoUsecase
              .call(CourseParameter(coursessnumber: event.coursessnumbers));
          print(res);
          emit(state.copyWith(
            coursess: res,
            requestState: RequestState.loaded,
          ));
        } catch (e) {
          print(e);
          emit(state.copyWith(
            errormsg: e.toString(),
            requestState: RequestState.error,
          ));
        }
      },
    );
    on<ChangeColorEvent>(
      (event, emit) =>
          color == Colors.white ? color = Colors.red : color = Colors.white,
    );
    on<GetEventsEvent>(
      (event, emit) async {
        try {
          final res =
              await getEventsUsecase.call(EventParameters(event.coursessId));
          emit(state.copyWith(
            coursessEvents: res,
            requestState: RequestState.loaded,
          ));
        } catch (e) {
          emit(state.copyWith(
            errormsg: e.toString(),
            requestState: RequestState.error,
          ));
        }
      },
    );
  }
  getCoursessInfo(event, emit) async {
    (event, emit) async {
      print('ggggggggggggggggggggggggggg');
      try {
        final res = await getCourseInfoUsecase
            .call(CourseParameter(coursessnumber: event.coursessnumbers));
        print(res);
        emit(state.copyWith(
          coursess: res,
          requestState: RequestState.loaded,
        ));
      } catch (e) {
        print(e);
        emit(state.copyWith(
          errormsg: e.toString(),
          requestState: RequestState.error,
        ));
      }
    };
  }
}
