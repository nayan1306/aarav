import 'package:flutter/material.dart';

/// A widget that displays the currently selected date and time and allows
/// the user to pick a new date and time. This version is styled for a dark theme.
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
        "${selectedDateTime.day.toString().padLeft(2, '0')}-"
        "${selectedDateTime.month.toString().padLeft(2, '0')}-"
        "${selectedDateTime.year.toString().padLeft(4, '0')}";

    final int hour = selectedDateTime.hour % 12;
    final String formattedHour =
        hour == 0 ? '12' : hour.toString().padLeft(2, '0');
    final String minute = selectedDateTime.minute.toString().padLeft(2, '0');
    final String period = selectedDateTime.hour >= 12 ? 'PM' : 'AM';
    final String time = "$formattedHour:$minute $period";

    return "🗓️ $date    🕛 $time";
  }

  /// Launch the date picker then the time picker.
  Future<void> _pickDateTime() async {
    // Pick the date first.
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color.fromARGB(173, 255, 255, 255),
              onPrimary: Colors.white,
              surface: Color.fromARGB(211, 58, 58, 58),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.black,
          ),
          child: child!,
        );
      },
    );
    if (pickedDate == null) return;

    // Then pick the time.
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: const TimePickerThemeData(
              dialBackgroundColor: Color.fromARGB(255, 0, 0, 0),
              dialHandColor: Colors.blueAccent,
              entryModeIconColor: Colors.blueAccent,
            ),
            dialogBackgroundColor: Colors.black,
          ),
          child: child!,
        );
      },
    );
    if (pickedTime == null) return;

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[850]!, Colors.grey[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              formattedDateTime,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            onPressed: _pickDateTime,
          ),
        ],
      ),
    );
  }
}
