import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/mood_summary_model.dart';

class MoodCalendar extends StatefulWidget {
  const MoodCalendar({super.key});

  @override
  _MoodCalendarState createState() => _MoodCalendarState();
}

class _MoodCalendarState extends State<MoodCalendar> {
  late DateTime _selectedDate;
  CalendarFormat _calendarFormat = CalendarFormat.week; // Start in week mode
  Map<DateTime, String> moodEmojis = {}; // Stores date-wise mood emojis

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _loadMoodData(); // Load mood data on startup
  }

  /// Function to load mood data from Hive and store emojis mapped to dates
  void _loadMoodData() {
    final moodSummaryBox = Hive.box<MoodSummary>('moodSummaries');

    Map<DateTime, String> tempMoodEmojis = {}; // Temporary storage for emojis

    for (int i = 0; i < moodSummaryBox.length; i++) {
      final moodSummary = moodSummaryBox.getAt(i);
      if (moodSummary != null) {
        DateTime moodDate = DateTime.parse(moodSummary.timestamp);
        DateTime onlyDate = DateTime(
          moodDate.year,
          moodDate.month,
          moodDate.day,
        );

        // Get emoji based on mood score
        String emoji = getMoodEmoji(moodSummary.moodScore);

        // Store the latest mood for the day
        tempMoodEmojis[onlyDate] = emoji;
      }
    }

    // Ensure state updates AFTER Hive data is loaded
    setState(() {
      moodEmojis = tempMoodEmojis;
    });
  }

  /// Function to get the appropriate emoji for a given mood score
  String getMoodEmoji(int moodScore) {
    if (moodScore >= 8) {
      return "😃"; // Very Happy
    } else if (moodScore >= 5) {
      return "😊"; // Neutral/Okay
    } else {
      return "😞"; // Sad
    }
  }

  /// Function to minimize calendar back to week mode
  void _minimizeCalendar() {
    if (_calendarFormat == CalendarFormat.month) {
      setState(() {
        _calendarFormat = CalendarFormat.week;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures tap is detected anywhere
      onTap: _minimizeCalendar,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E), // Dark background
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _selectedDate,
              calendarFormat: _calendarFormat,
              availableCalendarFormats: const {
                CalendarFormat.week: 'Week',
                CalendarFormat.month: 'Month',
              },
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronIcon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                rightChevronIcon: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white70),
                weekendStyle: TextStyle(color: Colors.redAccent),
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                weekendTextStyle: const TextStyle(color: Colors.redAccent),
                defaultTextStyle: const TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                  _calendarFormat =
                      CalendarFormat.month; // Expand to month on selection
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  DateTime onlyDate = DateTime(date.year, date.month, date.day);
                  String? emoji = moodEmojis[onlyDate];
                  bool isSelected = isSameDay(date, _selectedDate);

                  return Center(
                    child: Text(
                      isSelected
                          ? emoji ?? date.day.toString()
                          : (emoji ?? "⭕"), // Show emoji or placeholder
                      style: TextStyle(
                        fontSize: isSelected ? 26 : 26,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color:
                            isSelected
                                ? Colors.orangeAccent
                                : const Color.fromARGB(255, 67, 66, 66),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
