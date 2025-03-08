import '../quotes_randomizer.dart';

/// **Overcoming Challenges Quotes & Images**
final List<String> overcomingQuotesRaw = [
  "Challenges are what make life interesting; overcoming them is what makes life meaningful.",
  "Every challenge is an opportunity in disguise.",
  "Obstacles are those frightful things you see when you take your eyes off your goal.",
  "When we face challenges, we discover our true strength.",
  "The bigger the challenge, the sweeter the victory.",
  "Success is not measured by the absence of challenges, but by how you overcome them.",
  "In the midst of challenges, your resilience is your best friend.",
  "Adversity introduces a man to himself.",
  "Difficulties in life are intended to make us better, not bitter.",
  "Overcoming challenges transforms the impossible into possible.",
  "The struggle you're in today is developing the strength you need tomorrow.",
  "When life gives you challenges, turn them into stepping stones.",
  "Every challenge you overcome makes you stronger and wiser.",
  "Obstacles are opportunities to grow and improve.",
  "Courage is not the absence of fear but the triumph over it.",
  "Your challenges do not define you; how you overcome them does.",
  "Every setback is a setup for a comeback.",
  "The greatest challenges in life bring out our greatest potential.",
  "Success is about rising above the challenges, not avoiding them.",
  "If the challenge seems too great, you're close to a breakthrough.",
  "Challenges are the catalysts for growth and progress.",
  "What seems like a mountain today will become a stepping stone tomorrow.",
  "Don't let challenges break you; let them build you.",
  "Every challenge conquered adds to your inner strength.",
  "Overcoming challenges is the pathway to personal triumph.",
  "Tough times never last, but tough people do.",
  "The road to success is paved with challenges, each one an opportunity.",
  "When you overcome a challenge, you realize your potential is limitless.",
  "In every challenge, there is a chance to learn and evolve.",
  "The ability to overcome challenges is the key to a fulfilling life.",
];

final List<String> overcomingImages = [
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

/// Generate the final list of shuffled overcoming challenges quotes with random images.
final List<QuoteItem> overcomingQuotes = getShuffledQuotes(
  overcomingQuotesRaw,
  overcomingImages,
);
