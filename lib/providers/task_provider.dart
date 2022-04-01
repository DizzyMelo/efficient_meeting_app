import 'package:efficient_meeting_app/core/entities/user_entity.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  User? _user;
  DateTime? _dateToCompleteTask;
  TimeOfDay? _timeToCompleteTask;

  User? get user => _user;
  DateTime? get dateToCompleteTask => _dateToCompleteTask;
  TimeOfDay? get timeToCompleteTask => _timeToCompleteTask;

  String get dateToCompleteTaskStr => _formatDate(_dateToCompleteTask);
  String get timeToCompleteTaskStr => _formatTime(_timeToCompleteTask);

  setUserToAddTask(User user) {
    _user = user;
    notifyListeners();
  }

  unsetUserToAddTask() {
    _user = null;
    notifyListeners();
  }

  setDateToCompleteTask(DateTime date) {
    _dateToCompleteTask = date;
    notifyListeners();
  }

  setTimeToCompleteTask(TimeOfDay time) {
    _timeToCompleteTask = time;
    notifyListeners();
  }

  unsetDateToCompleteTast() {
    _dateToCompleteTask = null;
    notifyListeners();
  }

  unsetTimeToCompleteTast() {
    _timeToCompleteTask = null;
    notifyListeners();
  }

  unsetAll() {
    unsetUserToAddTask();
    unsetDateToCompleteTast();
    unsetTimeToCompleteTast();
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Select Date';

    return '${date.month}/${date.day}/${date.year}';
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Select Time';

    return '${time.hour}:${time.minute}';
  }
}
