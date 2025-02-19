import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:aarav/widgets/soundtile.dart';

class Soundspage extends StatefulWidget {
  const Soundspage({super.key});

  @override
  State<Soundspage> createState() => _SoundspageState();
}

class _SoundspageState extends State<Soundspage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentTitle;
  String? _currentSoundPath;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {});
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {});
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  void _playSound(String title, String soundPath) async {
    if (_currentSoundPath == soundPath && _isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(soundPath));
    }
    setState(() {
      _currentTitle = title;
      _currentSoundPath = soundPath;
      _isPlaying = true;
    });
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _stopMusic() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
      _currentTitle = null;
      _currentSoundPath = null;
    });
  }

  final List<Map<String, String>> soundList = [
    {
      'title': 'Relaxing Sound 1',
      'soundPath': 'sounds/rhythm-of-life-301382.mp3',
      'albumArtPath': 'assets/images/sound.gif',
    },
    {
      'title': 'Relaxing Sound 2',
      'soundPath': 'sounds/rhythm-of-life-301382.mp3',
      'albumArtPath': 'assets/images/sound.gif',
    },
    {
      'title': 'Calm Vibes',
      'soundPath': 'sounds/rhythm-of-life-301382.mp3',
      'albumArtPath': 'assets/images/sound.gif',
    },
    {
      'title': 'Nature Sounds',
      'soundPath': 'sounds/rhythm-of-life-301382.mp3',
      'albumArtPath': 'assets/images/sound.gif',
    },
    {
      'title': 'Ocean Waves',
      'soundPath': 'sounds/rhythm-of-life-301382.mp3',
      'albumArtPath': 'assets/images/sound.gif',
    },
    {
      'title': 'Forest Ambience',
      'soundPath': 'sounds/rhythm-of-life-301382.mp3',
      'albumArtPath': 'assets/images/sound.gif',
    },
    {
      'title': 'Lo-Fi Chill',
      'soundPath': 'sounds/rhythm-of-life-301382.mp3',
      'albumArtPath': 'assets/images/sound.gif',
    },
    {
      'title': 'Piano Bliss',
      'soundPath': 'sounds/rhythm-of-life-301382.mp3',
      'albumArtPath': 'assets/images/sound.gif',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),

        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let the music play on . . .",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: soundList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final sound = soundList[index];
                  return SoundTile(
                    albumArtPath: sound['albumArtPath']!,
                    title: sound['title']!,
                    soundPath: sound['soundPath']!,
                    onTap:
                        () => _playSound(sound['title']!, sound['soundPath']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          _currentTitle == null
              ? null
              : GestureDetector(
                onTap: () {}, // You can implement a full-screen player here
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        soundList.firstWhere(
                          (sound) => sound['title'] == _currentTitle,
                          orElse:
                              () => {
                                'albumArtPath': 'assets/images/default.png',
                              },
                        )['albumArtPath']!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _currentTitle!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: _togglePlayPause,
                      ),
                      IconButton(
                        icon: const Icon(Icons.stop, color: Colors.redAccent),
                        onPressed: _stopMusic,
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
