import 'package:aarav/Pages/moodtracker.dart/moodsummarypage.dart';
import 'package:flutter/material.dart';

class ExactFeelingPage1 extends StatefulWidget {
  final int moodScore;
  final List<Map<String, String>> selectedReasons;

  const ExactFeelingPage1({
    super.key,
    required this.moodScore,
    required this.selectedReasons,
  });

  @override
  State<ExactFeelingPage1> createState() => _ExactFeelingPageState();
}

class _ExactFeelingPageState extends State<ExactFeelingPage1> {
  final List<Map<String, String>> _feelings = [
    {"emoji": "😡", "text": "Furious"},
    {"emoji": "😠", "text": "Annoyed"},
    {"emoji": "🤬", "text": "Enraged"},
    {"emoji": "😤", "text": "Frustrated"},
    {"emoji": "😾", "text": "Irritated"},
    {"emoji": "🔥", "text": "Heated"},
    {"emoji": "😑", "text": "Resentful"},
    {"emoji": "💢", "text": "Agitated"},
  ];

  final Set<int> _selectedIndexes = {};

  void _toggleSelection(int index) {
    setState(() {
      if (_selectedIndexes.contains(index)) {
        _selectedIndexes.remove(index);
      } else {
        _selectedIndexes.add(index);
      }
    });
  }

  void _continue() {
    if (_selectedIndexes.isNotEmpty) {
      List<Map<String, String>> selectedFeelings =
          _selectedIndexes.map((index) {
            return {
              "emoji": _feelings[index]["emoji"]!,
              "text": _feelings[index]["text"]!,
            };
          }).toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => MoodSummaryPage(
                moodScore: widget.moodScore,
                selectedReasons: widget.selectedReasons,
                selectedFeelings: selectedFeelings,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("What are your exact feelings?"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Select the feelings that describe your mood:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Selectable Feelings List
            Expanded(
              child: ListView.builder(
                itemCount: _feelings.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedIndexes.contains(index);

                  return GestureDetector(
                    onTap: () => _toggleSelection(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? Colors.greenAccent.withOpacity(0.3)
                                : Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              isSelected
                                  ? Colors.greenAccent
                                  : Colors.grey[700]!,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _feelings[index]["emoji"]!,
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _feelings[index]["text"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Continue Button
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _selectedIndexes.isEmpty ? null : _continue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                disabledBackgroundColor: Colors.grey[700],
                disabledForegroundColor: Colors.black54,
              ),
              child: const Center(
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
