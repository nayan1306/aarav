import 'package:flutter/material.dart';

class MoodPage10 extends StatefulWidget {
  final int moodScore;
  const MoodPage10({super.key, required this.moodScore});

  @override
  State<MoodPage10> createState() => _MoodPage10State();
}

class _MoodPage10State extends State<MoodPage10> {
  final List<Map<String, String>> _reasons = [
    {"emoji": "😊", "text": "Had a great day"},
    {"emoji": "💪", "text": "Achieved a goal"},
    {"emoji": "🎉", "text": "Something exciting happened"},
    {"emoji": "💖", "text": "Feeling loved"},
    {"emoji": "🏋️", "text": "Worked out"},
    {"emoji": "🌿", "text": "Spent time in nature"},
    {"emoji": "🎶", "text": "Enjoyed music"},
    {"emoji": "🧘", "text": "Relaxed & stress-free"},
    {"emoji": "🤫", "text": "Anonymous"},
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
      List<String> selectedReasons =
          _selectedIndexes.map((index) => _reasons[index]["text"]!).toList();

      // Print selected reasons (replace with actual navigation or logic)
      print("Selected Reasons: $selectedReasons");

      // TODO: Navigate to next step/page if required
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("What makes you feel this way?"),
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
              "Select one or more reasons:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // List of selectable mood reasons
            Expanded(
              child: ListView.builder(
                itemCount: _reasons.length,
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
                            _reasons[index]["emoji"]!,
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _reasons[index]["text"]!,
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
