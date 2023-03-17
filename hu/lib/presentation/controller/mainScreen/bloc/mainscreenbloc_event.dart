part of 'mainscreenbloc_bloc.dart';

@immutable
abstract class MainscreenblocEvent {}

class GetUserInfoEvent extends MainscreenblocEvent {
  final String id;

  GetUserInfoEvent({required this.id});
}
