import 'package:hu/core/base%20usecase/base_usecase.dart';
import 'package:hu/data/model/event_model.dart';
import 'package:hu/domain/reposetiry/base_reposetiry.dart';

class GetEventsUsecase extends BaseUsercase<List<EventModel>, EventParameters> {
  final BaseReposetiry baseReposetiry;

  GetEventsUsecase(this.baseReposetiry);
  @override
  Future<List<EventModel>> call(EventParameters parameters) async {
    return await baseReposetiry.getEvents(parameters);
  }
}

class EventParameters {
  final List courseid;

  EventParameters(this.courseid);
}
