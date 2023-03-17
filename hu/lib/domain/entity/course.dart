class Course {
  String days;
  String name;
  String time;
  String notes;
  String place;
  DateTime exam;
  DateTime assignment;
  Course({
    required this.days,
    required this.assignment,
    required this.exam,
    required this.notes,
    required this.name,
    required this.place,
    required this.time,
  });
}
