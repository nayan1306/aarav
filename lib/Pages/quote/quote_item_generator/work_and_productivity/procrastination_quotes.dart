import '../quotes_randomizer.dart';

/// **Overcoming Procrastination Quotes & Images**
final List<String> procrastinationQuotesRaw = [
  "A year from now you may wish you had started today.",
  "You don’t have to be great to start, but you have to start to be great.",
  "Do something today that your future self will thank you for.",
  "The secret of getting ahead is getting started.",
  "Action is the foundational key to all success.",
  "Procrastination is opportunity’s assassin.",
  "Don’t wait. The time will never be just right.",
  "You may delay, but time will not.",
  "Small deeds done are better than great deeds planned.",
  "Start where you are. Use what you have. Do what you can.",
  "The best way to get something done is to begin.",
  "A journey of a thousand miles begins with a single step.",
  "Take massive, determined action.",
  "The greatest amount of wasted time is the time not getting started.",
  "What is not started today is never finished tomorrow.",
  "Stop waiting for the perfect moment. Take the moment and make it perfect.",
  "Don’t put off until tomorrow what you can do today.",
  "If you want to make an easy job seem hard, just keep putting it off.",
  "Dream big. Start small. Act now.",
  "The way to get started is to quit talking and begin doing.",
  "Done is better than perfect.",
  "You don’t have to see the whole staircase, just take the first step.",
  "Today is your opportunity to build the tomorrow you want.",
  "One day, or day one. You decide.",
  "The only difference between success and failure is the ability to take action.",
  "When you feel like procrastinating, remember why you started.",
  "It’s not about having time. It’s about making time.",
  "The future depends on what you do today.",
  "Success is the sum of small efforts repeated day in and day out.",
  "Don’t fear failure. Fear being in the same place next year as you are today.",
  "Discipline is choosing between what you want now and what you want most.",
  "Someday is not a day of the week.",
  "The best time to start was yesterday. The next best time is now.",
  "Nothing will work unless you do.",
  "You miss 100% of the shots you don’t take.",
  "If you spend too much time thinking about a thing, you’ll never get it done.",
  "Procrastination is the grave in which opportunity is buried.",
  "Focus on progress, not perfection.",
  "Success comes to those who act, not those who wait.",
  "The habit of always putting off an experience until you have time or money is one of the greatest burglars of joy.",
  "Inspiration is for amateurs. The rest of us just show up and get to work.",
  "Don’t let perfection become procrastination. Do it now.",
  "Motivation gets you started. Habit keeps you going.",
  "Overcoming procrastination is not about time management, it’s about self-management.",
  "Kill procrastination with action.",
  "The cost of procrastination is the life you could have lived.",
  "Replace excuses with effort. Replace laziness with determination. Replace procrastination with action.",
  "The greatest productivity hack is starting before you feel ready.",
  "Once begun, half done.",
  "Tomorrow is often the busiest day of the week.",
  "Time is what we want most, but what we use worst.",
  "If it’s important to you, you’ll find a way. If not, you’ll find an excuse.",
  "Get busy living or get busy dying.",
  "Don’t let your dreams be dreams.",
  "Motivation is what gets you started. Habit is what keeps you going.",
  "Take action! An inch of movement will bring you closer to your goals than a mile of intention.",
  "Fear of failure leads to procrastination. Action cures fear.",
  "We are what we repeatedly do. Excellence, then, is not an act but a habit.",
  "Turn your ‘I’ll do it later’ into ‘I’m doing it now.’",
  "A goal without a plan is just a wish.",
  "If you never start, you’ll never finish.",
  "The difference between who you are and who you want to be is what you do.",
  "Make today count. You’ll never get it back.",
  "Work while it is day, for the night is coming when no one can work.",
  "There are seven days in the week, and someday isn’t one of them.",
  "The moment you take action is the moment you win.",
  "Your future is created by what you do today, not tomorrow.",
  "You’re always one decision away from a totally different life.",
];

final List<String> procrastinationImages = [
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

/// Generate the final list of shuffled overcoming procrastination quotes with random images.
final List<QuoteItem> procrastinationQuotes = getShuffledQuotes(
  procrastinationQuotesRaw,
  procrastinationImages,
);
