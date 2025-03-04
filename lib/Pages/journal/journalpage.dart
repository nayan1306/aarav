import 'dart:io';

import 'package:aarav/Pages/journal/datetimepicker.dart';
import 'package:aarav/Pages/journal/texteditor.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final GlobalKey<JournalTextEditorState> _journalEditorKey =
      GlobalKey<JournalTextEditorState>();

  final List<File> _images = [];
  final List<String> _recordings = [];

  // Instantiate the recorder.
  final FlutterSoundRecord _audioRecorder = FlutterSoundRecord();
  // This AudioPlayer is used for playback.
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isRecording = false;

  /// Pick an image from the gallery.
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

  /// Toggle audio recording.
  Future<void> _toggleRecording() async {
    if (_isRecording) {
      // Stop recording.
      String? filePath = await _audioRecorder.stop();
      if (filePath != null) {
        setState(() {
          _recordings.add(filePath);
          _isRecording = false;
        });
      } else {
        setState(() {
          _isRecording = false;
        });
      }
    } else {
      Directory tempDir = await getTemporaryDirectory();
      String filePath =
          '${tempDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

      bool hasPermission = await _audioRecorder.hasPermission();
      if (hasPermission) {
        await _audioRecorder.start(
          path: filePath,
          encoder: AudioEncoder.AAC,
          bitRate: 128000,
          samplingRate: 44100,
        );
        setState(() {
          _isRecording = true;
        });
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Audio recording permission denied")),
          );
        }
      }
    }
  }

  /// Expand an image into a full-screen preview.
  void _expandImage(File imageFile) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          child: InteractiveViewer(
            panEnabled: false,
            boundaryMargin: const EdgeInsets.all(20),
            child: Image.file(imageFile, fit: BoxFit.contain),
          ),
        );
      },
    );
  }

  /// Returns the duration of the recording using a temporary AudioPlayer.
  Future<Duration?> _getRecordingDuration(String filePath) async {
    final AudioPlayer tempPlayer = AudioPlayer();
    try {
      await tempPlayer.setSource(DeviceFileSource(filePath));
      Duration? duration = await tempPlayer.getDuration();
      await tempPlayer.dispose();
      return duration;
    } catch (e) {
      await tempPlayer.dispose();
      return null;
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  /// Play an audio recording and show a floating snackbar with controls.
  Future<void> _playRecording(String filePath) async {
    Duration? duration = await _getRecordingDuration(filePath);
    String durationText =
        duration != null ? _formatDuration(duration) : "--:--";

    // Show snackbar with player controls on top.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        content: Row(
          children: [
            Expanded(
              child: Text(
                'Playing ($durationText)',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.pause, color: Colors.white),
              onPressed: () async {
                await _audioPlayer.pause();
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
      ),
    );

    try {
      await _audioPlayer.play(DeviceFileSource(filePath));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error playing recording: $e')));
      }
    }
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    // Top row: Steps chip and Audio chip.
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Chip(
                    //       avatar: const Icon(
                    //         Icons.directions_walk,
                    //         color: Colors.white,
                    //       ),
                    //       label: const Text(
                    //         '1900 Steps',
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       backgroundColor: Colors.grey[800],
                    //     ),
                    //     Chip(
                    //       backgroundColor: Colors.grey[800],
                    //       label: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: const [
                    //           Icon(Icons.graphic_eq, color: Colors.grey),
                    //           SizedBox(width: 8),
                    //           Text(
                    //             '01:25',
                    //             style: TextStyle(color: Colors.white),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 16),
                    // Display images with tap-to-expand and delete functionality.
                    if (_images.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            _images.map((img) {
                              return GestureDetector(
                                onTap: () => _expandImage(img),
                                child: Stack(
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
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    const SizedBox(height: 16),
                    // Display audio recordings as a list with duration info.
                    if (_recordings.isNotEmpty)
                      Column(
                        children:
                            _recordings.map((path) {
                              int index = _recordings.indexOf(path) + 1;
                              return Padding(
                                padding: const EdgeInsets.only(
                                  // top: 8,
                                  bottom: 5,
                                ),
                                child: ListTile(
                                  minVerticalPadding: 10,
                                  tileColor: Colors.grey[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  leading: const Icon(
                                    Icons.audiotrack,
                                    color: Colors.white,
                                  ),
                                  // Use FutureBuilder to load and display duration.
                                  title: FutureBuilder<Duration?>(
                                    future: _getRecordingDuration(path),
                                    builder: (context, snapshot) {
                                      String durationText = "--:--";
                                      if (snapshot.hasData &&
                                          snapshot.data != null) {
                                        durationText = _formatDuration(
                                          snapshot.data!,
                                        );
                                      }
                                      return Text(
                                        'Recording $index - $durationText',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _recordings.remove(path);
                                      });
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(
                                          201,
                                          255,
                                          116,
                                          116,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () => _playRecording(path),
                                ),
                              );
                            }).toList(),
                      ),
                    const SizedBox(height: 16),
                    // Journal text editor widget.
                    JournalTextEditor(key: _journalEditorKey),
                    const SizedBox(height: 10), // Extra space for bottom bar.
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // BottomAppBar with four rounded buttons.
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        elevation: 10,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRoundedButton(
                icon: Icons.add_photo_alternate,
                onTap: _pickImage,
              ),
              _buildRoundedButton(
                icon: _isRecording ? Icons.stop : Icons.mic,
                onTap: _toggleRecording,
              ),
              _buildRoundedButton(
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
              _buildRoundedButton(
                icon: Icons.more_vert,
                onTap: () {
                  // Implement additional options if needed.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper to build a rounded rectangular button.
  Widget _buildRoundedButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.grey[700]!, Colors.grey[900]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
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
