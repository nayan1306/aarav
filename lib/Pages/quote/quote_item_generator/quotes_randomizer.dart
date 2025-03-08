import 'dart:math';

/// Data model for a quote with a randomly assigned image.
class QuoteItem {
  final String quote;
  final String imagePath;

  QuoteItem({required this.quote, required this.imagePath});
}

/// Universal function to shuffle quotes and assign random images.
/// - [quotesRaw]: List of quotes (strings).
/// - [images]: List of image paths (strings).
List<QuoteItem> getShuffledQuotes(List<String> quotesRaw, List<String> images) {
  final Random random = Random();
  // Shuffle the list of quotes
  quotesRaw.shuffle(random);
  // Map each quote to a QuoteItem with a randomly chosen image
  return quotesRaw.map((quote) {
    String randomImage = images[random.nextInt(images.length)];
    return QuoteItem(quote: quote, imagePath: randomImage);
  }).toList();
}
