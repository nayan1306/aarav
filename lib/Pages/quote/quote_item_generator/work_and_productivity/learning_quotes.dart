import '../quotes_randomizer.dart';

/// **Learning from Failure Quotes & Images**
final List<String> learningQuotesRaw = [
  "Failure is simply the opportunity to begin again, this time more intelligently.",
  "Every failure is a step closer to success.",
  "Failure is a detour, not a dead-end street.",
  "Mistakes are the portals of discovery.",
  "Failure is the key to success; each mistake teaches us something.",
  "Embrace failure as a learning opportunity, not a defeat.",
  "Failure is not falling down but refusing to get up.",
  "I have not failed. I've just found 10,000 ways that won't work.",
  "Failure is an event, not a person.",
  "It's not how far you fall, but how high you bounce that counts.",
  "Failure teaches us more than success ever could.",
  "The greatest lessons are learned from our failures.",
  "Failure is the condiment that gives success its flavor.",
  "A failure is not always a mistake; it may simply be the best one can do under the circumstances.",
  "Success is built on the lessons of failure.",
  "Learning from failure is the pathway to innovation.",
  "Failure is a stepping stone to success.",
  "Our greatest glory is not in never falling, but in rising every time we fall.",
  "Mistakes are the proof that you're trying.",
  "Without failure, success has no meaning.",
  "Failure isn't fatal, but failure to learn from it is.",
  "Failure is the tuition you pay for success.",
  "To succeed, you must first be willing to fail.",
  "Every setback is a setup for a comeback.",
  "Let every failure be a lesson and every lesson fuel your future success.",
  "The only real mistake is the one from which we learn nothing.",
  "Failure provides the richest soil for growth.",
  "Failure is a bruise, not a tattoo.",
  "You learn more from a failure than from a success.",
  "Turn your failures into lessons, and your lessons into success.",
];

final List<String> learningImages = [
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

/// Generate the final list of shuffled learning from failure quotes with random images.
final List<QuoteItem> learningQuotes = getShuffledQuotes(
  learningQuotesRaw,
  learningImages,
);
