import 'dart:math';

/// Data model for a affirmation with a randomly assigned image.
class AffirmationItem {
  final String affirmation;
  final String imagePath;

  AffirmationItem({required this.affirmation, required this.imagePath});
}

/// Universal function to shuffle affirmations and assign random images.
/// - [affirmationsRaw]: List of affirmations (strings).
/// - [images]: List of image paths (strings).
List<AffirmationItem> getShuffledaffirmations(
  List<String> affirmationsRaw,
  List<String> images,
) {
  final Random random = Random();
  // Shuffle the list of affirmations
  affirmationsRaw.shuffle(random);
  // Map each affirmation to a AffirmationItem with a randomly chosen image
  return affirmationsRaw.map((affirmation) {
    String randomImage = images[random.nextInt(images.length)];
    return AffirmationItem(affirmation: affirmation, imagePath: randomImage);
  }).toList();
}
