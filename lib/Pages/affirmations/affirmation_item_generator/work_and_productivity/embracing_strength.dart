import '../affirmation_randomizer.dart';

/// **Bouncing Back from Failure Quotes & Images**
final List<String> embracingStrengthsAffirmationRaw = [
  "Failure is not the opposite of success; it’s part of success.",
  "Our greatest glory is not in never falling, but in rising every time we fall.",
];

final List<String> bouncebackImages = [
  "assets/images/quotes/bg/1.jpg",
  "assets/images/quotes/bg/2.jpg",
  "assets/images/quotes/bg/3.jpg",
  "assets/images/quotes/bg/4.jpg",
  "assets/images/quotes/bg/5.jpg",
  "assets/images/quotes/bg/6.jpg",
  "assets/images/quotes/bg/7.jpg",
  "assets/images/quotes/bg/8.jpg",
  "assets/images/quotes/bg/9.jpg",
  "assets/images/quotes/bg/10.jpg",
];

/// Generate the final list of shuffled bounce back quotes with random images.
final List<AffirmationItem> embracingStrengthsAffirmation =
    getShuffledaffirmations(embracingStrengthsAffirmationRaw, bouncebackImages);
