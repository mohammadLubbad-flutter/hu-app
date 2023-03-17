import 'package:hu/domain/entity/event.dart';

class EventModel extends Event {
  EventModel(
      {required super.subject,
      required super.event,
      required super.day,
      required super.month});

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
      subject: json['subject'],
      day: json['day'],
      event: json['event'],
      month: json['month']);
}
