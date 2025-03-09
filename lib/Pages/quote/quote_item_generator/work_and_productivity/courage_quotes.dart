import '../quotes_randomizer.dart';

/// **Courage and Strength Quotes & Images**

final List<String> courageQuotesRaw = [
  "Courage is resistance to fear, mastery of fear—not absence of fear.",
  "Strength does not come from physical capacity. It comes from an indomitable will.",
  "Courage starts with showing up and letting ourselves be seen.",
  "You gain strength, courage, and confidence by every experience in which you really stop to look fear in the face.",
  "Courage is not having the strength to go on; it is going on when you don’t have the strength.",
  "A hero is an ordinary individual who finds the strength to persevere and endure in spite of overwhelming obstacles.",
  "Be strong. You never know who you are inspiring.",
  "Fear is a reaction. Courage is a decision.",
  "Bravery is not the absence of fear but the action in the face of fear.",
  "The only thing we have to fear is fear itself.",
  "Courage is knowing what not to fear.",
  "Hardships often prepare ordinary people for an extraordinary destiny.",
  "Stand up to your obstacles and do something about them. You will find that they haven’t half the strength you think they have.",
  "A strong, positive self-image is the best possible preparation for success.",
  "Strength grows in the moments when you think you can't go on but keep going anyway.",
  "Do not pray for an easy life; pray for the strength to endure a difficult one.",
  "With the new day comes new strength and new thoughts.",
  "The strongest people are not those who show strength in front of us but those who win battles we know nothing about.",
  "No one saves us but ourselves. No one can and no one may. We ourselves must walk the path.",
  "Success is not final, failure is not fatal: it is the courage to continue that counts.",
  "Strength and growth come only through continuous effort and struggle.",
  "You have power over your mind—not outside events. Realize this, and you will find strength.",
  "It is not the mountain we conquer but ourselves.",
  "A strong woman looks a challenge dead in the eye and gives it a wink.",
  "Scared is what you’re feeling. Brave is what you’re doing.",
  "You never know how strong you are until being strong is your only choice.",
  "True courage is being afraid, and going ahead and doing your job anyhow.",
  "Adversity is like a strong wind. It tears away from us all but the things that cannot be torn so that we see ourselves as we really are.",
  "He who conquers others is strong; he who conquers himself is mighty.",
];

final List<String> courageImages = [
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

/// Generate the final list of shuffled courage quotes with random images.
// Notice this name vvvvvvvvvvvvvvvvvvvvv this you have to put in here
final List<QuoteItem> courageQuotes = getShuffledQuotes(
  courageQuotesRaw, //TODO: Notice this name
  courageImages,
);
