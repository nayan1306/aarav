import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:aarav/models/mood_summary_model.dart'; // Adjust the import according to your project structure

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _clearHiveBox() async {
    try {
      // Use the same box name as in the timeline page
      if (!Hive.isBoxOpen('moodSummaries')) {
        await Hive.openBox<MoodSummary>('moodSummaries');
      }
      final moodSummaryBox = Hive.box<MoodSummary>('moodSummaries');

      if (moodSummaryBox.isNotEmpty) {
        print("\n========== Hive Box Data (moodSummaries) ==========");

        // Print raw data from Hive box
        for (int i = 0; i < moodSummaryBox.length; i++) {
          print("Entry $i: ${moodSummaryBox.getAt(i)}");
        }

        print("====================================================\n");

        bool? confirmDelete = await _showConfirmationDialog();
        if (confirmDelete == true) {
          await moodSummaryBox.clear();

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("All mood summaries cleared!"),
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No mood data to clear."),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error clearing data: $e"),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<bool?> _showConfirmationDialog() async {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Confirm Deletion"),
            content: const Text(
              "Are you sure you want to clear all mood data?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Clear", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _clearHiveBox,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Clear Mood Data",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
