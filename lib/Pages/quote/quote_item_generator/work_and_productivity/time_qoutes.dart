import '../quotes_randomizer.dart';

/// **Time Management Wisdom Quotes & Images**
final List<String> timeQuotesRaw = [
  "Time is what we want most, but what we use worst.",
  "The key is in not spending time, but in investing it.",
  "Lost time is never found again.",
  "You may delay, but time will not.",
  "Time is the wisest counselor of all.",
  "A man who dares to waste one hour of time has not discovered the value of life.",
  "The way we spend our time defines who we are.",
  "Either you run the day, or the day runs you.",
  "Time isn’t the main thing. It’s the only thing.",
  "Better three hours too soon than one minute too late.",
  "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
  "Time flies over us, but leaves its shadow behind.",
  "If you love life, don’t waste time, for time is what life is made up of.",
  "It’s not about having time. It’s about making time.",
  "Don’t spend time beating on a wall, hoping to transform it into a door.",
  "Yesterday is gone. Tomorrow has not yet come. We have only today. Let us begin.",
  "Take care of the minutes and the hours will take care of themselves.",
  "The bad news is time flies. The good news is you’re the pilot.",
  "Time is a created thing. To say 'I don’t have time' is like saying, 'I don’t want to.'",
  "Your time is limited, so don’t waste it living someone else’s life.",
  "There’s only one thing more precious than our time and that’s who we spend it on.",
  "A year from now you may wish you had started today.",
  "You can’t make up for lost time. You can only do better in the future.",
  "The time you enjoy wasting is not wasted time.",
  "Time is what keeps everything from happening at once.",
  "We must use time wisely and forever realize that the time is always ripe to do right.",
  "Time is a gift that most of us take for granted until it’s too late.",
  "Don’t watch the clock; do what it does. Keep going.",
  "Time is money, but more importantly, time is life.",
  "Time management is life management.",
];

final List<String> timeImages = [
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

/// Generate the final list of shuffled time management wisdom quotes with random images.
final List<QuoteItem> timeQuotes = getShuffledQuotes(timeQuotesRaw, timeImages);
