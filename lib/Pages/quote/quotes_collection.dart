import 'dart:math';

/// Data model for a quote with a randomly assigned image.
class QuoteItem {
  final String quote;
  final String imagePath;

  QuoteItem({required this.quote, required this.imagePath});
}

// List of images (shared across categories)
final List<String> imagePaths = [
  "assets/images/wp.jpg",
  "assets/images/test_bg.png",
];

// Function to shuffle quotes and assign random images
List<QuoteItem> generateShuffledQuotes(List<String> quotes) {
  final Random random = Random();

  // Shuffle quotes to ensure randomness every time
  quotes.shuffle(random);

  return quotes.map((quote) {
    // Assign a random image to each quote
    String randomImage = imagePaths[random.nextInt(imagePaths.length)];
    return QuoteItem(quote: quote, imagePath: randomImage);
  }).toList();
}

// **Quotes categorized**

// Perseverance Quotes
final List<String> perseveranceQuotesRaw = [
  "It does not matter how slowly you go as long as you do not stop.",
  "Perseverance is not a long race; it is many short races one after the other.",
  "Hardships often prepare ordinary people for an extraordinary destiny.",
];

// Motivation Quotes
final List<String> motivationQuotesRaw = [
  "Believe in yourself and all that you are.",
  "You miss 100% of the shots you don’t take.",
  "Dream big and dare to fail.",
];

// Success Quotes
final List<String> successQuotesRaw = [
  "Success is not final, failure is not fatal: it is the courage to continue that counts.",
  "The best way to predict the future is to create it.",
  "With the new day comes new strength and new thoughts.",
];

// Generate shuffled quotes with random images
List<QuoteItem> getShuffledPerseveranceQuotes() =>
    generateShuffledQuotes(perseveranceQuotesRaw);

List<QuoteItem> getShuffledMotivationQuotes() =>
    generateShuffledQuotes(motivationQuotesRaw);

List<QuoteItem> getShuffledSuccessQuotes() =>
    generateShuffledQuotes(successQuotesRaw);
