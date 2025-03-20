import 'package:aarav/Pages/explorepage.dart';
import 'package:aarav/Pages/moodtracker.dart/tracker_placeholder_page.dart';
import 'package:flutter/material.dart';
import 'package:aarav/Pages/affirmations/affirmation_page.dart';
import 'package:aarav/Pages/breathing/breathingpage.dart';
import 'package:aarav/Pages/journal/journalpage.dart';
import 'package:aarav/Pages/quote/quotepage.dart';
import 'package:aarav/Pages/sounds/soundspage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mental health topics/needs
  final List<MentalHealthNeed> mentalHealthNeeds = [
    MentalHealthNeed(
      name: "Anxiety Relief",
      icon: Icons.bubble_chart,
      color: Colors.blue,
    ),
    MentalHealthNeed(
      name: "Stress Management",
      icon: Icons.spa,
      color: Colors.green,
    ),
    MentalHealthNeed(
      name: "Mood Improvement",
      icon: Icons.sentiment_satisfied_alt,
      color: Colors.amber,
    ),
    MentalHealthNeed(
      name: "Better Sleep",
      icon: Icons.nightlight_round,
      color: Colors.indigo,
    ),
    MentalHealthNeed(
      name: "Self-Confidence",
      icon: Icons.emoji_people,
      color: Colors.orange,
    ),
    MentalHealthNeed(
      name: "Focus & Concentration",
      icon: Icons.center_focus_strong,
      color: Colors.purple,
    ),
    MentalHealthNeed(
      name: "Emotional Balance",
      icon: Icons.balance,
      color: Colors.teal,
    ),
    MentalHealthNeed(
      name: "Mindfulness",
      icon: Icons.self_improvement,
      color: Colors.cyan,
    ),
  ];

  // Available wellness activities
  final List<WellnessActivity> allActivities = [
    WellnessActivity(
      name: "Deep Breathing",
      description: "Reduce anxiety with guided breathing exercises",
      duration: 5,
      page: const BreathingPage(),
      imagePath: "assets/images/test_bg.png",
      tags: ["Anxiety Relief", "Stress Management", "Focus & Concentration"],
      bestTimeOfDay: TimeOfDay.morning,
    ),
    WellnessActivity(
      name: "Positive Affirmations",
      description: "Boost your confidence with daily affirmations",
      duration: 3,
      page: const AffirmationPage(),
      imagePath: "assets/images/test_bg.png",
      tags: ["Self-Confidence", "Mood Improvement", "Emotional Balance"],
      bestTimeOfDay: TimeOfDay.morning,
    ),
    WellnessActivity(
      name: "Calming Sounds",
      description: "Relax with soothing sound therapy",
      duration: 10,
      page: const Soundspage(),
      imagePath: "assets/images/test_bg.png",
      tags: ["Anxiety Relief", "Better Sleep", "Stress Management"],
      bestTimeOfDay: TimeOfDay.evening,
    ),
    WellnessActivity(
      name: "Inspirational Quotes",
      description: "Find motivation in daily quotes",
      duration: 2,
      page: const QuotePage(),
      imagePath: "assets/images/test_bg.png",
      tags: ["Mood Improvement", "Self-Confidence", "Mindfulness"],
      bestTimeOfDay: TimeOfDay.afternoon,
    ),
    WellnessActivity(
      name: "Journaling",
      description: "Process your thoughts and emotions",
      duration: 10,
      page: const JournalPage(),
      imagePath: "assets/images/test_bg.png",
      tags: ["Emotional Balance", "Stress Management", "Mindfulness"],
      bestTimeOfDay: TimeOfDay.evening,
    ),
    WellnessActivity(
      name: "Guided Meditation",
      description: "Find peace with guided meditation",
      duration: 15,
      page: const ExplorePage(), // Replace with actual meditation page
      imagePath: "assets/images/test_bg.png",
      tags: [
        "Mindfulness",
        "Anxiety Relief",
        "Emotional Balance",
        "Focus & Concentration",
      ],
      bestTimeOfDay: TimeOfDay.any,
    ),
    WellnessActivity(
      name: "Mood Check-in",
      description: "Track your mood and identify patterns",
      duration: 1,
      page: TrackerPlaceholderPage(), // Replace with actual mood tracker page
      imagePath: "assets/images/test_bg.png",
      tags: ["Mood Improvement", "Emotional Balance", "Mindfulness"],
      bestTimeOfDay: TimeOfDay.any,
    ),
    WellnessActivity(
      name: "Sleep Sounds",
      description: "Fall asleep faster with relaxing sounds",
      duration: 30,
      page: const ExplorePage(),
      imagePath: "assets/images/test_bg.png",
      tags: ["Better Sleep", "Anxiety Relief"],
      bestTimeOfDay: TimeOfDay.night,
    ),
  ];

  // User's selected mental health needs
  List<String> selectedNeeds = [];

  // User's personalized schedule
  List<ScheduledActivity> scheduledActivities = [];

  // Flag to track if preferences are loaded
  bool _preferencesLoaded = false;

  @override
  void initState() {
    super.initState();
    // Load preferences from cache
    _loadPreferences();
  }

  // Load preferences from SharedPreferences
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedNeeds = prefs.getStringList('selectedNeeds');

    if (cachedNeeds != null && cachedNeeds.isNotEmpty) {
      setState(() {
        selectedNeeds = cachedNeeds;
        _preferencesLoaded = true;
        _generateSmartSchedule();
      });
    } else {
      setState(() {
        _preferencesLoaded = true;
      });
      // Show selection modal only if no preferences were found
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showNeedsSelectionModal();
      });
    }
  }

  // Save preferences to SharedPreferences
  Future<void> _savePreferences(List<String> needs) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedNeeds', needs);
  }

  void _showNeedsSelectionModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => NeedsSelectionModal(
            mentalHealthNeeds: mentalHealthNeeds,
            selectedNeeds: selectedNeeds,
            onSave: (selected) {
              setState(() {
                selectedNeeds = selected;
                _generateSmartSchedule();
                // Save the selected needs to preferences
                _savePreferences(selected);
              });
            },
          ),
    );
  }

  void _generateSmartSchedule() {
    scheduledActivities = [];
    final now = DateTime.now();
    final currentHour = now.hour;

    // Determine current time period
    TimeOfDay currentTimePeriod;
    if (currentHour >= 5 && currentHour < 12) {
      currentTimePeriod = TimeOfDay.morning;
    } else if (currentHour >= 12 && currentHour < 17) {
      currentTimePeriod = TimeOfDay.afternoon;
    } else if (currentHour >= 17 && currentHour < 21) {
      currentTimePeriod = TimeOfDay.evening;
    } else {
      currentTimePeriod = TimeOfDay.night;
    }

    // Create a smart schedule based on selected needs and time of day
    // First, add activities that match the current time period
    List<WellnessActivity> recommendedActivities =
        allActivities
            .where(
              (activity) =>
                  activity.tags.any((tag) => selectedNeeds.contains(tag)) &&
                  (activity.bestTimeOfDay == currentTimePeriod ||
                      activity.bestTimeOfDay == TimeOfDay.any),
            )
            .toList();

    // Add activities for other time periods
    for (TimeOfDay timeOfDay in TimeOfDay.values) {
      if (timeOfDay != currentTimePeriod && timeOfDay != TimeOfDay.any) {
        recommendedActivities.addAll(
          allActivities
              .where(
                (activity) =>
                    activity.tags.any((tag) => selectedNeeds.contains(tag)) &&
                    activity.bestTimeOfDay == timeOfDay,
              )
              .toList(),
        );
      }
    }

    // Remove duplicates and limit to 10 activities
    final uniqueActivities = <WellnessActivity>{};
    for (var activity in recommendedActivities) {
      uniqueActivities.add(activity);
      if (uniqueActivities.length >= 10) break;
    }

    // Create schedule
    DateTime activityTime = now;
    for (var activity in uniqueActivities) {
      scheduledActivities.add(
        ScheduledActivity(activity: activity, scheduledTime: activityTime),
      );
      activityTime = activityTime.add(Duration(minutes: activity.duration + 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator while preferences are being loaded
    if (!_preferencesLoaded) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2C3E50), Color(0xFF1A1A2E)],
            ),
          ),
          child: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(104, 0, 0, 0),
      //   elevation: 0,
      //   title: const Text(
      //     "Your Wellness Journey",
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.settings),
      //       onPressed: _showNeedsSelectionModal,
      //     ),
      //   ],
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2C3E50), Color(0xFF1A1A2E)],
          ),
        ),
        child:
            selectedNeeds.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Select parameters for personalized wellness schedule",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _showNeedsSelectionModal,
                        child: const Text("Select Needs"),
                      ),
                    ],
                  ),
                )
                : SmartScheduleTimeline(
                  scheduledActivities: scheduledActivities,
                  selectedNeeds: selectedNeeds,
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNeedsSelectionModal,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class MentalHealthNeed {
  final String name;
  final IconData icon;
  final Color color;

  MentalHealthNeed({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class WellnessActivity {
  final String name;
  final String description;
  final int duration; // in minutes
  final Widget page;
  final String imagePath;
  final List<String> tags;
  final TimeOfDay bestTimeOfDay;

  WellnessActivity({
    required this.name,
    required this.description,
    required this.duration,
    required this.page,
    required this.imagePath,
    required this.tags,
    required this.bestTimeOfDay,
  });
}

enum TimeOfDay { morning, afternoon, evening, night, any }

class ScheduledActivity {
  final WellnessActivity activity;
  final DateTime scheduledTime;

  ScheduledActivity({required this.activity, required this.scheduledTime});
}

class NeedsSelectionModal extends StatefulWidget {
  final List<MentalHealthNeed> mentalHealthNeeds;
  final List<String> selectedNeeds;
  final Function(List<String>) onSave;

  const NeedsSelectionModal({
    super.key,
    required this.mentalHealthNeeds,
    required this.selectedNeeds,
    required this.onSave,
  });

  @override
  State<NeedsSelectionModal> createState() => _NeedsSelectionModalState();
}

class _NeedsSelectionModalState extends State<NeedsSelectionModal> {
  late List<String> tempSelected;

  @override
  void initState() {
    super.initState();
    tempSelected = List.from(widget.selectedNeeds);
  }

  void _toggleNeed(String needName) {
    setState(() {
      if (tempSelected.contains(needName)) {
        tempSelected.remove(needName);
      } else {
        tempSelected.add(needName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A2E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "What are you looking for?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Select your mental health needs and we'll create a personalized wellness schedule for you",
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: widget.mentalHealthNeeds.length,
              itemBuilder: (context, index) {
                final need = widget.mentalHealthNeeds[index];
                final isSelected = tempSelected.contains(need.name);

                return GestureDetector(
                  onTap: () => _toggleNeed(need.name),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? need.color.withOpacity(0.7)
                              : const Color.fromARGB(150, 58, 66, 86),
                      borderRadius: BorderRadius.circular(15),
                      border:
                          isSelected
                              ? Border.all(color: Colors.white, width: 2)
                              : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(need.icon, color: Colors.white, size: 30),
                        const SizedBox(height: 8),
                        Text(
                          need.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 16,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                widget.onSave(tempSelected);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 145, 185, 255),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Create My Schedule",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmartScheduleTimeline extends StatelessWidget {
  final List<ScheduledActivity> scheduledActivities;
  final List<String> selectedNeeds;

  const SmartScheduleTimeline({
    super.key,
    required this.scheduledActivities,
    required this.selectedNeeds,
  });

  @override
  Widget build(BuildContext context) {
    // Get current time
    final now = DateTime.now();
    final timeFormatter = DateFormat('h:mm a');
    final dateFormatter = DateFormat('EEEE, MMM d');

    return ListView(
      padding: const EdgeInsets.only(top: 100, bottom: 20),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateFormatter.format(now),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Your Wellness Schedule",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Based on: ${selectedNeeds.join(', ')}",
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // If no activities are scheduled
        if (scheduledActivities.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Select your mental health needs to create a personalized schedule",
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
          ),

        // Display scheduled activities
        ...scheduledActivities.map((scheduledActivity) {
          final activity = scheduledActivity.activity;
          final time = scheduledActivity.scheduledTime;
          final isCurrentOrFuture =
              time.isAfter(now) || time.isAtSameMomentAs(now);

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline indicator
                Container(
                  width: 70,
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        timeFormatter.format(time),
                        style: TextStyle(
                          color:
                              isCurrentOrFuture ? Colors.white : Colors.white60,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color:
                              isCurrentOrFuture
                                  ? Colors.blueAccent
                                  : Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 50,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),

                // Activity card
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => activity.page),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors:
                              isCurrentOrFuture
                                  ? [
                                    const Color(0xFF3498DB),
                                    const Color(0xFF2980B9),
                                  ]
                                  : [
                                    Colors.grey.shade700,
                                    Colors.grey.shade800,
                                  ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Opacity(
                                opacity: 0.2,
                                child: Image.asset(
                                  activity.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      activity.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "${activity.duration} min",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  activity.description,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    for (var tag in activity.tags.take(2))
                                      Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Text(
                                          tag,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    if (activity.tags.length > 2)
                                      Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Text(
                                          "+${activity.tags.length - 2}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
