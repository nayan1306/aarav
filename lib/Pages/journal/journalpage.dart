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
  // GlobalKey to access the JournalTextEditorState for retrieving the text values
  final GlobalKey<JournalTextEditorState> _journalEditorKey =
      GlobalKey<JournalTextEditorState>();

  // List to hold the added images.
  final List<File> _images = [];

  /// Uses ImagePicker to pick an image from the gallery and adds it to [_images].
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
      backgroundColor: Colors.black, // Black themed background
      appBar: AppBar(
        title: const DateTimePickerWidget(), // DateTime picker widget in AppBar
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
                    // Main image (example image)
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
                    // Button to add images
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: _pickImage,
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Add Image',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Display added images with a cross button for removal.
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
                    // Use the separate JournalTextEditor widget for text editing
                    JournalTextEditor(key: _journalEditorKey),
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
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Retrieve text values from the JournalTextEditor widget using the GlobalKey
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
                child: const Text('Save for Journal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
