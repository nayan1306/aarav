import 'dart:io';

import 'package:aarav/Pages/journal/datetimepicker.dart';
import 'package:aarav/Pages/journal/texteditor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final GlobalKey<JournalTextEditorState> _journalEditorKey =
      GlobalKey<JournalTextEditorState>();
  final List<File> _images = [];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const DateTimePickerWidget(),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          avatar: const Icon(
                            Icons.directions_walk,
                            color: Colors.white,
                          ),
                          label: const Text(
                            '1900 Steps',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.grey[800],
                        ),
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
                    if (_images.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            _images.map((img) {
                              return Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      img,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _images.remove(img);
                                        });
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black54,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                      ),
                    const SizedBox(height: 16),
                    JournalTextEditor(key: _journalEditorKey),
                    const SizedBox(
                      height: 10,
                    ), // Extra space to prevent overlap
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // BottomAppBar with two buttons
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        elevation: 10,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Add Image Button
              _buildCircularButton(
                icon: Icons.add_photo_alternate,
                onTap: _pickImage,
              ),

              // Audio Icon
              _buildCircularButton(
                icon: Icons.mic,
                onTap: () {
                  // Implement audio recording
                },
              ),

              // Save Button
              _buildCircularButton(
                icon: Icons.save,
                onTap: () {
                  final journalData =
                      _journalEditorKey.currentState?.getJournalData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Journal Saved!\nTitle: ${journalData?['title']}\nDescription: ${journalData?['description']}',
                      ),
                    ),
                  );
                },
              ),

              // More Options
              _buildCircularButton(
                icon: Icons.more_vert,
                onTap: () {
                  // Implement more options action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper function to build circular icon buttons
  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12), // Rounded corners
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Smooth rounded edges
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
              const Color.fromARGB(255, 117, 117, 117).withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Center(child: Icon(icon, color: Colors.white, size: 28)),
      ),
    );
  }
}
