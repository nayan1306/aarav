import 'package:hive/hive.dart';

part 'mood_summary_model.g.dart';

@HiveType(typeId: 0)
class MoodSummary extends HiveObject {
  @HiveField(0)
  int moodScore;

  @HiveField(1)
  List<String> selectedReasons;

  @HiveField(2)
  List<String> selectedFeelings;

  @HiveField(3)
  String timestamp;

  MoodSummary({
    required this.moodScore,
    required this.selectedReasons,
    required this.selectedFeelings,
    required this.timestamp,
  });
}
