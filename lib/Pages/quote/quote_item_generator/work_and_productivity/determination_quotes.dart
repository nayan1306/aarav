import '../quotes_randomizer.dart';

/// **Perseverance Quotes & Images**
// TODO:change this name
//  this is this name
final List<String> determinationQuotesRaw = [
  "It does not matter how slowly you go as long as you do not stop.",
  "Perseverance is not a long race; it is many short races one after the other.",
  "Hardships often prepare ordinary people for an extraordinary destiny.",
  "Success is stumbling from failure to failure with no loss of enthusiasm.",
  "A river cuts through rock not because of its power, but because of its persistence.",
  "Courage doesn’t always roar. Sometimes, it’s the quiet voice at the end of the day saying, ‘I will try again tomorrow.’",
  "Perseverance is the hard work you do after you get tired of doing the hard work you already did.",
  "Through perseverance, many people win success out of what seemed destined to be certain failure.",
  "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack of will.",
  "The secret of our success is that we never, never give up.",
  "Every great story happened when someone decided not to give up.",
  "Don’t be discouraged. It’s often the last key in the bunch that opens the lock.",
  "Great works are performed not by strength but by perseverance.",
  "Patience, persistence, and perspiration make an unbeatable combination for success.",
  "Energy and persistence conquer all things.",
  "Never give up on something you really want. It’s difficult to wait, but more difficult to regret.",
  "Many of life’s failures are people who did not realize how close they were to success when they gave up.",
  "If you are going through hell, keep going.",
  "Failure is only the opportunity to begin again, this time more intelligently.",
  "The moment you’re ready to quit is usually the moment right before a miracle happens. Don’t give up!",
  "Difficulties strengthen the mind, as labor does the body.",
  "When you feel like quitting, think about why you started.",
  "Perseverance is failing 19 times and succeeding the 20th.",
  "Every accomplishment starts with the decision to try.",
  "A winner is just a loser who tried one more time.",
  "Believe you can and you’re halfway there.",
  "A little more persistence, a little more effort, and what seemed hopeless failure may turn into glorious success.",
  "Grit is not just simple elbow-grease term for rugged persistence. It is an often invisible display of endurance that lets you stay in an uncomfortable place, work hard to improve, and do it again and again.",
  "Sometimes adversity is what you need to face in order to become successful.",
  "Perseverance is not about the absence of failure but the determination to rise every time you fall.",
];

final List<String> determinationImages = [
  "assets/images/wp.jpg",
  "assets/images/test_bg.png",
];

/// Generate the final list of shuffled perseverance quotes with random images.
// Notice this name vvvvvvvvvvvvvvvvvvvvv this you have to put in here
final List<QuoteItem> determinationQuotes = getShuffledQuotes(
  determinationQuotesRaw, //TODO: Notice this name
  determinationImages,
);
