import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/bounceback_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/change_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/courage_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/curiosity_quote.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/family_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/forgiveness_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/friendship_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/growth_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/kindness_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/knowledge_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/learning_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/overcoming_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/perseverance_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/present_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/procrastination_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/purpose_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/selflove_quote.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/spirituality_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/success_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/teaching_quote.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/time_qoutes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/workplace_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/motivation_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/work_and_productivity/leadership_quotes.dart';
import 'package:aarav/Pages/quote/quoteviewer.dart';
import 'package:aarav/widgets/quotesrecommendedcard.dart';
import 'package:aarav/widgets/quotetile.dart';
import 'package:flutter/material.dart';

class AffirmationPage extends StatefulWidget {
  const AffirmationPage({super.key});

  @override
  State<AffirmationPage> createState() => _AffirmationPageState();
}

class _AffirmationPageState extends State<AffirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Recommended for you",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12), // Adds spacing
          // Wrap the horizontal ListView inside a SizedBox
          SizedBox(
            height: 160, // Set a fixed height to ensure visibility
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                QuotesRecommendedCard(
                  assetImagePath:
                      "assets/images/quotes/Success and Productivity/Ru0TtpHp.jpg",
                  title: "Top Affirmations",
                  subtitle: "Gloabal Top Affirmations among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath:
                      "assets/images/quotes/Success and Productivity/Ru0TtpHp.jpg",
                  title: "Top Affirmations",
                  subtitle: "Gloabal Top Affirmations among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath:
                      "assets/images/quotes/Wisdom and Growth/Living in the Present.png",
                  title: "Top Affirmations",
                  subtitle: "Gloabal Top Affirmations among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath:
                      "assets/images/quotes/Life and Resilience/Embracing Change.png",
                  title: "Top Affirmations",
                  subtitle:
                      "assets/images/quotes/Life and Resilience/Overcoming Challenges.png",
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Success and Productivity",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                // TODO: copy paste the same thing as below in rest of the Quote Tiles
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Success and Productivity/Ru0TtpHp.jpg",
                  title: "Leadership and Influence",
                  // TODO: Add the same on tap navigation after creating the quotes page
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: leadershipQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Success and Productivity/oCE5oAWa.png",
                  title: "Workplace Ethics and Values",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: workplaceQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Success and Productivity/22XPfiL_.png",
                  title: "Motivation for Hard Work",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: motivationQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Success and Productivity/Overcoming Procrastination.png",
                  title: "Overcoming Procrastination",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QuoteViewer.fromItems(
                              items: procrastinationQuotes,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Success and Productivity/Time Management Wisdom.png",
                  title: "Time Management",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: timeQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Success and Productivity/Success and Failure.png",
                  title: "Success and Failure",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: successQuotes),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // TDOD: Add bouncing scroll physics and change the sections accordingly
          Text(
            "Life and Resilience ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Life and Resilience/Finding Purpose in Life.png",
                  title: "Finding Purpose in Life",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: purposeQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Life and Resilience/Embracing Change.png",
                  title: "Embracing Change",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: changeQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Life and Resilience/Overcoming Challenges.png",
                  title: "Overcoming Challenges",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: overcomingQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Life and Resilience/Courage and Strength.png",
                  title: "Courage and Strength",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: courageQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Life and Resilience/Bouncing Back from Failure.png",
                  title: "Bouncing Back from Failure",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: bouncebackQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Life and Resilience/The Power of Perseverance.png",
                  title: "The Power of Perseverance",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QuoteViewer.fromItems(
                              items: perseveranceQuotes,
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // TDOD: Add bouncing scroll physics and change the sections accordingly
          Text(
            "Relationships and Inner Peace",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Relationships and Inner Peace/Friendship and Trust.png",
                  title: "Friendship and Trust",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: friendshipQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Relationships and Inner Peace/Family Bonds.png",
                  title: "Family Bonds",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: familyQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Relationships and Inner Peace/Self-Love and Confidence.png",
                  title: "Self-Love and Confidence",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: selfloveQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Relationships and Inner Peace/Kindness and Compassion.png",
                  title: "Kindness and Compassion",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: kindnessQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Relationships and Inner Peace/Forgiveness and Understanding.png",
                  title: "Forgiveness and Understanding",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: forgivenessQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Relationships and Inner Peace/Spirituality and Mindfulness.png",
                  title: "Spirituality and Mindfulness",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QuoteViewer.fromItems(
                              items: spiritualityQuotes,
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // TDOD: Add bouncing scroll physics and change the sections accordingly
          Text(
            "Wisdom and Growth",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Wisdom and Growth/Knowledge and Education.png",
                  title: "Knowledge and Education",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: knowledgeQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Wisdom and Growth/Learning from Failure.png",
                  title: "Learning from Failure",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: learningQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Wisdom and Growth/Curiosity and Exploration.png",
                  title: "Curiosity and Exploration",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: curiosityQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Wisdom and Growth/The Art of Teaching.png",
                  title: "The Art of Teaching",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: teachingQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Wisdom and Growth/Personal Growth and Development.png",
                  title: "Personal Growth and Development",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: growthQuotes),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/quotes/Wisdom and Growth/Living in the Present.png",
                  title: "Living in the Present",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                QuoteViewer.fromItems(items: presentQuotes),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
