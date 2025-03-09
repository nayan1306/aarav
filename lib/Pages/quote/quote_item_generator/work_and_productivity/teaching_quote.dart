import '../quotes_randomizer.dart';

/// **the art of teaching Quotes & Images**
final List<String> teachingQuotesRaw = [
  "Teaching is the one profession that creates all other professions.",
  "A good teacher can inspire hope, ignite the imagination, and instill a love of learning.",
  "Education is not the filling of a pail, but the lighting of a fire.",
  "The art of teaching is the art of assisting discovery.",
  "Teachers affect eternity; no one can tell where their influence stops.",
  "It is the supreme art of the teacher to awaken joy in creative expression and knowledge.",
  "A teacher takes a hand, opens a mind, and touches a heart.",
  "The best teachers are those who show you where to look but don’t tell you what to see.",
  "To teach is to learn twice.",
  "What a teacher is, is more important than what they teach.",
  "The greatest sign of success for a teacher is to be able to say, ‘The children are now working as if I did not exist.’",
  "Good teaching is more a giving of right questions than a giving of right answers.",
  "The influence of a great teacher can never be erased.",
  "A truly special teacher is very wise and sees tomorrow in every child’s eyes.",
  "One child, one teacher, one book, and one pen can change the world.",
  "Students don’t care how much you know until they know how much you care.",
  "Great teachers empathize with kids, respect them, and believe that each one has something special that can be built upon.",
  "A great teacher is someone who can learn from their students, who can learn with them, and learns for them.",
  "Every teacher should realize they are a leader and inspire their students to achieve more than they thought possible.",
  "Education is the key to unlocking the world, a passport to freedom.",
  "An investment in knowledge pays the best interest.",
  "Teaching kids to count is fine, but teaching them what counts is best.",
  "A teacher’s job is to take a bunch of live wires and see that they are well-grounded.",
  "No one should teach who is not in love with teaching.",
  "Teachers plant the seeds of knowledge that last a lifetime.",
  "Learning is a treasure that will follow its owner everywhere.",
  "The best teachers teach from the heart, not from the book.",
  "A good teacher is like a candle—it consumes itself to light the way for others.",
  "Education is the most powerful weapon which you can use to change the world.",
  "Great teachers teach more by what they are than by what they say.",
];

final List<String> teachingImages = [
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

/// Generate the final list of shuffled teaching quotes with random images.
final List<QuoteItem> teachingQuotes = getShuffledQuotes(
  teachingQuotesRaw,
  teachingImages,
);
