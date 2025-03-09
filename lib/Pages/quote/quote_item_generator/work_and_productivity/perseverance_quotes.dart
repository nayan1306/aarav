import '../quotes_randomizer.dart';

/// **The Power of Perseverance Quotes & Images**
final List<String> perseveranceQuotesRaw = [
  "Perseverance is the power that transforms dreams into reality.",
  "The true power of perseverance is revealed in the strength to keep going.",
  "Harness the power of perseverance to overcome any obstacle.",
  "When you persist, even the smallest steps can lead to great achievements.",
  "Perseverance is not just endurance; it’s the power to change your destiny.",
  "Every setback is a setup for the power of a comeback.",
  "The power of perseverance lies in its ability to turn adversity into opportunity.",
  "In the face of challenges, your perseverance becomes your power.",
  "Keep pushing forward; the power of perseverance fuels success.",
  "The strength to continue is the power that lies within perseverance.",
  "Perseverance gives power to your dreams, turning them into reality.",
  "Let the power of perseverance be the light that guides your path.",
  "True power is shown in your resilience and ability to persevere.",
  "The power of perseverance can move mountains.",
  "Unleash the power of perseverance and let it drive you to greatness.",
  "Every step forward, no matter how small, is a display of perseverance's power.",
  "The power of perseverance is the key to unlocking endless possibilities.",
  "Keep the flame of perseverance burning, for it is the source of your strength.",
  "In persistence, find your power and the courage to keep moving.",
  "The power of perseverance turns trials into triumphs.",
];

final List<String> perseveranceImages = [
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

/// Generate the final list of shuffled perseverance quotes with random images.
final List<QuoteItem> perseveranceQuotes = getShuffledQuotes(
  perseveranceQuotesRaw,
  perseveranceImages,
);
