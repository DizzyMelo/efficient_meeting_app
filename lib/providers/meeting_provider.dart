import 'package:efficient_meeting_app/core/entities/meeting_entity.dart';
import 'package:flutter/material.dart';

class MeetingProvider with ChangeNotifier {
  Meeting? _selectedMeeting;

  Meeting? get selectedMeeting => _selectedMeeting;

  void setMeeting(Meeting meeting) {
    _selectedMeeting = meeting;
    notifyListeners();
  }

  void unsetMeeting() {
    _selectedMeeting = null;
    notifyListeners();
  }
}
