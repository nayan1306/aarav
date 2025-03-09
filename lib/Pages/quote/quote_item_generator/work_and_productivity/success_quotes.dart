import '../quotes_randomizer.dart';

/// **Success & Failure Quotes & Images**

final List<String> successQuotesRaw = [
  "Success is not final, failure is not fatal: it is the courage to continue that counts.",
  "Don't be afraid to fail. Be afraid not to try.",
  "Failure is simply the opportunity to begin again, this time more intelligently.",
  "Success is how high you bounce when you hit bottom.",
  "The only real failure in life is not to be true to the best one knows.",
  "Winners are not people who never fail but people who never quit.",
  "Success usually comes to those who are too busy to be looking for it.",
  "Failure will never overtake me if my determination to succeed is strong enough.",
  "I have not failed. I've just found 10,000 ways that won't work.",
  "Success is getting what you want. Happiness is wanting what you get.",
  "Every failure is a step to success.",
  "Do not be embarrassed by your failures, learn from them and start again.",
  "The only limit to our realization of tomorrow is our doubts of today.",
  "Doubt kills more dreams than failure ever will.",
  "Our greatest glory is not in never falling, but in rising every time we fall.",
  "Success doesn’t come from what you do occasionally. It comes from what you do consistently.",
  "Don't wait. The time will never be just right.",
  "You learn more from failure than from success. Don’t let it stop you. Failure builds character.",
  "Many of life's failures are people who did not realize how close they were to success when they gave up.",
  "Success is a journey, not a destination. The doing is often more important than the outcome.",
  "Courage to continue is what separates success from failure.",
  "Success isn’t always about greatness. It’s about consistency.",
  "Most great people have attained their greatest success just one step beyond their greatest failure.",
  "Failure is the condiment that gives success its flavor.",
  "Behind every successful person, there are years of hard work, failure, and persistence.",
  "Fall seven times, stand up eight.",
  "Success is not how far you got, but the distance you traveled from where you started.",
  "There are no secrets to success. It is the result of preparation, hard work, and learning from failure.",
  "The road to success is dotted with many tempting parking spaces.",
  "Every failure is a lesson. If you are not willing to fail, you are not ready to succeed.",
];

final List<String> successImages = [
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

/// Generate the final list of shuffled success & failure quotes with random images.
final List<QuoteItem> successQuotes = getShuffledQuotes(
  successQuotesRaw,
  successImages,
);
