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

    print("\n========== Hive Box Data (moodSummaries) ==========");

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

        print("""
Entry $i:
  - Date: $onlyDate
  - Timestamp: ${moodSummary.timestamp}
  - Mood Score: ${moodSummary.moodScore}
  - Emoji: $emoji
  - Selected Reasons: ${moodSummary.selectedReasons}
  - Selected Feelings: ${moodSummary.selectedFeelings}
        """);
      }
    }

    print("====================================================\n");

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: TableCalendar(
        firstDay: DateTime.utc(2024, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _selectedDate,
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.white),
          weekendStyle: TextStyle(color: Colors.redAccent),
        ),
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: TextStyle(color: Colors.redAccent),
          defaultTextStyle: TextStyle(color: Colors.white),
          todayDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Color.fromARGB(61, 255, 153, 0),
            shape: BoxShape.circle,
          ),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDate = selectedDay;
          });
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) {
            DateTime onlyDate = DateTime(date.year, date.month, date.day);
            String? emoji =
                moodEmojis[onlyDate]; // Fetch mood emoji for the date
            bool isSelected = isSameDay(date, _selectedDate);

            return Center(
              child: Text(
                isSelected
                    ? "${emoji ?? ""} ${date.day}" // Show emoji + date if selected
                    : (emoji ??
                        date.day.toString()), // Show emoji or date normally
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(207, 69, 69, 69),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
