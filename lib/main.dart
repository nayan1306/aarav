import 'package:aarav/mainscreen.dart';
import 'package:aarav/provider/screen_size_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/mood_summary_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(MoodSummaryAdapter());

  // Open the box
  await Hive.openBox<MoodSummary>('moodSummaries');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ScreenSizeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '𝜦𝜦ℝ𝜦Ѵ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainScreen(), // Set MainScreen as the home
    );
  }
}
