import 'package:aarav/Pages/journal/datetimepicker.dart';
import 'package:flutter/material.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final TextEditingController _titleController = TextEditingController(
    text: 'Morning Vibes, Ocean City, Maryland',
  );
  final TextEditingController _descriptionController = TextEditingController(
    text:
        'Today marked the beginning of a delightful journey to Ocean City, Maryland. The coastal vibes greeted us as soon as we set foot on the sandy shores. The salty breeze carried the promise of a memorable adventure. Morning was spent strolling along the iconic boardwalk, where the blend of vintage charm and modern amusements created a captivating atmosphere. From the aroma of freshly made funnel cakes to the cheerful sounds of laughter from amusement rides, every step offered a new sensory delight.',
  );

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Overall black theme
      appBar: AppBar(
        title: const DateTimePickerWidget(), // DateTime picker widget
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            // Card holding the main content
            Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row: Walk info + audio snippet
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // "Walk 1900 Steps" Chip
                        Chip(
                          avatar: const Icon(
                            Icons.directions_walk,
                            color: Colors.white,
                          ),
                          label: const Text(
                            '1900 Steps',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        // Audio snippet "01:25"
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.graphic_eq, color: Colors.grey),
                              SizedBox(width: 8),
                              Text(
                                '01:25',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Main image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://images.pexels.com/photos/409696/pexels-photo-409696.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Title TextField
                    TextField(
                      controller: _titleController,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Title',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Description TextField
                    TextField(
                      controller: _descriptionController,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Description',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // "Save for Journal" button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  foregroundColor: Colors.white, // Button text color
                ),
                onPressed: () {
                  // Display a SnackBar to indicate the save action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Journal Saved!')),
                  );
                },
                child: const Text('Save for Journal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
