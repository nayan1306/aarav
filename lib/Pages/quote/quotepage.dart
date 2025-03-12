import 'package:aarav/Pages/quote/quote_item_generator/life_and_resilieance/bounceback_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/life_and_resilieance/change_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/life_and_resilieance/courage_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/wisdom_and_growth/curiosity_quote.dart';
import 'package:aarav/Pages/quote/quote_item_generator/relationships_and_inner_peace/family_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/relationships_and_inner_peace/forgiveness_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/relationships_and_inner_peace/friendship_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/wisdom_and_growth/growth_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/relationships_and_inner_peace/kindness_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/wisdom_and_growth/knowledge_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/wisdom_and_growth/learning_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/life_and_resilieance/overcoming_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/life_and_resilieance/perseverance_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/wisdom_and_growth/present_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/sub_headings_quotes/procrastination_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/life_and_resilieance/purpose_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/relationships_and_inner_peace/selflove_quote.dart';
import 'package:aarav/Pages/quote/quote_item_generator/relationships_and_inner_peace/spirituality_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/sub_headings_quotes/success_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/wisdom_and_growth/teaching_quote.dart';
import 'package:aarav/Pages/quote/quote_item_generator/sub_headings_quotes/time_qoutes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/sub_headings_quotes/workplace_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/sub_headings_quotes/motivation_quotes.dart';
import 'package:aarav/Pages/quote/quote_item_generator/sub_headings_quotes/leadership_quotes.dart';
import 'package:aarav/Pages/quote/quoteviewer.dart';
import 'package:aarav/widgets/quotesrecommendedcard.dart';
import 'package:aarav/widgets/quotetile.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _BreathingPageState();
}

class _BreathingPageState extends State<QuotePage> {
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
                      "assets/images/quotes/Quotes icons/Success_and_Failure-removebg-preview.png",
                  title: "Top Quotes",
                  subtitle: "Gloabal top Quotes among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath:
                      "assets/images/quotes/Quotes icons/Personal Growth and Development.png",
                  title: "Top Quotes",
                  subtitle: "Gloabal top Quotes among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath:
                      "assets/images/quotes/Quotes icons/Overcoming Challenges.png",
                  title: "Top Quotes",
                  subtitle: "Gloabal top Quotes among users",
                ),
                SizedBox(width: 10),
                QuotesRecommendedCard(
                  assetImagePath:
                      "assets/images/quotes/Quotes icons/Learning from Failure.png",
                  title: "Top Quotes",
                  subtitle:
                      "assets/images/quotes/Quotes icons/time_management_wisdom-removebg-preview.png",
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
                      "assets/images/quotes/Quotes icons/leadership and influence.png",
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
                      "assets/images/quotes/Quotes icons/workpalce ethics and values.png",
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
                      "assets/images/quotes/Quotes icons/motivation for hardwork.png",
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
                      "assets/images/quotes/Quotes icons/overcoming_procrastination-removebg-preview.png",
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
                      "assets/images/quotes/Quotes icons/time_management_wisdom-removebg-preview.png",
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
                      "assets/images/quotes/Quotes icons/Success_and_Failure-removebg-preview.png",
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
                      "assets/images/quotes/Quotes icons/Finding Purpose in Life.png",
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
                      "assets/images/quotes/Quotes icons/Embracing Change.png",
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
                      "assets/images/quotes/Quotes icons/Overcoming Challenges.png",
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
                      "assets/images/quotes/Quotes icons/Courage and Strength.png",
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
                      "assets/images/quotes/Quotes icons/Bouncing Back from Failure.png",
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
                      "assets/images/quotes/Quotes icons/The Power of Perseverance.png",
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
                      "assets/images/quotes/Quotes icons/Friendship and Trust.png",
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
                      "assets/images/quotes/Quotes icons/Family Bonds.png",
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
                      "assets/images/quotes/Quotes icons/Self-Love and Confidence.png",
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
                      "assets/images/quotes/Quotes icons/Kindness and Compassion.png",
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
                      "assets/images/quotes/Quotes icons/Forgiveness and Understanding.png",
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
                      "assets/images/quotes/Quotes icons/Spirituality and Mindfulness.png",
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
                      "assets/images/quotes/Quotes icons/Knowledge and Education.png",
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
                      "assets/images/quotes/Quotes icons/Learning from Failure.png",
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
                      "assets/images/quotes/Quotes icons/Curiosity and Exploration.png",
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
                      "assets/images/quotes/Quotes icons/The Art of Teaching.png",
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
                      "assets/images/quotes/Quotes icons/Personal Growth and Development.png",
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
                      "assets/images/quotes/Quotes icons/Living in the Present.png",
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
