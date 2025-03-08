import '../quotes_randomizer.dart';

/// **Spirituality and Mindfulness Quotes & Images**
final List<String> spiritualityQuotesRaw = [
  "The journey inward is the most important journey of all.",
  "Peace comes from within. Do not seek it without.",
  "Mindfulness is the art of being present in every moment.",
  "In the silence of meditation, we find our true self.",
  "Spiritual growth begins when you let go of what you cannot control.",
  "Embrace the journey of self-discovery with an open heart.",
  "Awareness is the first step towards transformation.",
  "Let your soul be your guide, not your fears.",
  "Find stillness in the chaos, and you will discover serenity.",
  "True spirituality is living with compassion and love.",
  "Mindfulness turns chaos into clarity.",
  "The present moment is a gift; that’s why we call it the present.",
  "Quiet your mind, and the soul will speak.",
  "Meditation is the gateway to a peaceful life.",
  "Let go, and let your spirit soar.",
  "In every breath, find a moment of mindfulness.",
  "Spirituality is not a destination but a continuous journey.",
  "When you find inner peace, you create outer harmony.",
  "Awaken to the beauty of life through mindful living.",
  "The essence of spirituality is connection—to yourself, others, and the universe.",
  "Let your inner light shine and illuminate the path.",
  "The mind is a wonderful servant, but a terrible master.",
  "Peace begins with a smile and a mindful heart.",
  "Nurture your soul with moments of stillness and reflection.",
  "Your true self is not found in the noise, but in the silence.",
  "Mindfulness is the key to unlocking the treasures of the heart.",
  "A calm mind brings inner strength and self-confidence.",
  "Spiritual awakening is the realization of your own divine nature.",
  "Every moment is an opportunity to connect with your inner self.",
  "Let mindfulness be the bridge between your thoughts and your heart.",
];

final List<String> spiritualityImages = [
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

/// Generate the final list of shuffled spirituality and mindfulness quotes with random images.
final List<QuoteItem> spiritualityQuotes = getShuffledQuotes(
  spiritualityQuotesRaw,
  spiritualityImages,
);
