import '../quotes_randomizer.dart';

/// **Perseverance Quotes & Images**
final List<String> perseveranceQuotesRaw = [
  "It does not matter how slowly you go as long as you do not stop.",
  "Perseverance is not a long race; it is many short races one after the other.",
  "Hardships often prepare ordinary people for an extraordinary destiny.",
];

final List<String> perseveranceImages = [
  "assets/images/perseverance1.jpg",
  "assets/images/perseverance2.jpg",
];

/// Generate the final list of shuffled perseverance quotes with random images.
final List<QuoteItem> perseveranceQuotes = getShuffledQuotes(
  perseveranceQuotesRaw,
  perseveranceImages,
);
