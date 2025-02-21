import 'package:flutter/material.dart';

/// A separate widget that displays the currently selected date and time,
/// and lets the user pick a new date and time.
class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({super.key});

  @override
  State<DateTimePickerWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime selectedDateTime = DateTime.now();

  /// Format the date and time as "YYYY-MM-DD HH:MM"
  String get formattedDateTime {
    final date =
        "${selectedDateTime.year.toString().padLeft(4, '0')}-"
        "${selectedDateTime.month.toString().padLeft(2, '0')}-"
        "${selectedDateTime.day.toString().padLeft(2, '0')}";
    final time =
        "${selectedDateTime.hour.toString().padLeft(2, '0')}:"
        "${selectedDateTime.minute.toString().padLeft(2, '0')}";
    return "$date $time";
  }

  /// Launch the date picker and then the time picker
  Future<void> _pickDateTime() async {
    // Pick the date first
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate == null) return;

    // Then pick the time
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
    );
    if (pickedTime == null) return;

    // Combine date and time into a new DateTime object
    final newDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      selectedDateTime = newDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Date & Time: $formattedDateTime',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.calendar_today, color: Colors.white),
          onPressed: _pickDateTime,
        ),
      ],
    );
  }
}
