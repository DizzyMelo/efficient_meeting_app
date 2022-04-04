import 'package:efficient_meeting_app/core/entities/meeting_entity.dart';
import 'package:flutter/material.dart';

class MeetingProvider with ChangeNotifier {
  Meeting? _selectedMeeting;

  Meeting? get selectedMeeting => _selectedMeeting;

  DateTime? _dateToMeeting;
  TimeOfDay? _timeToMeeting;

  DateTime? get dateToMeeting => _dateToMeeting;
  TimeOfDay? get timeToMeeting => _timeToMeeting;

  String get dateToMeetingStr => _formatDate(_dateToMeeting);
  String get timeToMeetingStr => _formatTime(_timeToMeeting);

  setDateToMeeting(DateTime date) {
    _dateToMeeting = date;
    notifyListeners();
  }

  setTimeToMeeting(TimeOfDay time) {
    _timeToMeeting = time;
    notifyListeners();
  }

  unsetDateToCompleteTast() {
    _dateToMeeting = null;
    notifyListeners();
  }

  unsetTimeToCompleteTast() {
    _timeToMeeting = null;
    notifyListeners();
  }

  void setMeeting(Meeting meeting) {
    _selectedMeeting = meeting;
    notifyListeners();
  }

  void unsetMeeting() {
    _selectedMeeting = null;
    notifyListeners();
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Select Time';

    return '${time.hour}:${time.minute}';
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Select Date';

    return '${date.month}/${date.day}/${date.year}';
  }
}
