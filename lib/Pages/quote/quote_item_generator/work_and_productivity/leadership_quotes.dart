import '../quotes_randomizer.dart';

/// **Leadership and Influence Quotes & Images**
final List<String> leadershipQuotesRaw = [
  "Leadership is not about a title or a designation. It's about impact, influence, and inspiration.",
  "The greatest leader is not necessarily the one who does the greatest things. He is the one that gets people to do the greatest things.",
  "Leadership is the capacity to translate vision into reality.",
  "A leader is one who knows the way, goes the way, and shows the way.",
  "Leadership is unlocking people's potential to become better.",
  "The function of leadership is to produce more leaders, not more followers.",
  "Innovation distinguishes between a leader and a follower.",
  "A genuine leader is not a searcher for consensus but a molder of consensus.",
  "Leadership is about making others better as a result of your presence and ensuring that impact lasts in your absence.",
  "True leadership lies in guiding others to success.",
  "The quality of a leader is reflected in the standards they set for themselves.",
  "A leader takes people where they want to go; a great leader takes people where they don't necessarily want to go, but ought to be.",
  "Good leaders inspire people to have confidence in themselves.",
  "Leadership is not a position or a title; it is action and example.",
  "To handle yourself, use your head; to handle others, use your heart.",
  "Leaders don't force people to follow; they invite them on a journey.",
  "Effective leadership is putting first things first.",
  "The challenge of leadership is to be strong, but not rude; be kind, but not weak; be bold, but not a bully; be thoughtful, but not lazy; be humble, but not timid; be proud, but not arrogant.",
  "Great leaders are willing to sacrifice the numbers to save the people.",
  "Leadership is about vision and responsibility, not power.",
  "Leadership is the art of getting someone to do something you want done because they want to do it.",
  "The best executive is the one who has sense enough to pick good people to do what he wants done and the self-restraint not to interfere while they do it.",
  "A leader is best when people barely know he exists.",
  "The task of leadership is not to put greatness into people, but to elicit it, for the greatness is already there.",
  "The art of leadership is saying no, not saying yes.",
  "A leader sees more than others see, sees farther than others do, and sees before others do.",
  "Influence is the ultimate currency of leadership.",
  "Leadership and learning are indispensable to each other.",
  "The sign of a good leader is not how many followers you have, but how many leaders you create.",
  "Leadership is not about being in charge. It is about taking care of those in your charge.",
];

final List<String> leadershipImages = [
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

/// Generate the final list of shuffled leadership and influence quotes with random images.
final List<QuoteItem> leadershipQuotes = getShuffledQuotes(
  leadershipQuotesRaw,
  leadershipImages,
);
