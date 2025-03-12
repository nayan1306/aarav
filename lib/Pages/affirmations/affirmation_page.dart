import 'package:aarav/Pages/affirmations/affirmation_item_generator/work_and_productivity/embracing_strength.dart';
import 'package:aarav/Pages/affirmations/affirmation_viewer.dart';
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
            "Self-Belief & Confidence",
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
                      "assets/images/affermations icons/Embracing Your Strengths.png",
                  title: "Embracing Your Strengths",
                  // TODO: Add the same on tap navigation after creating the quotes page
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: embracingStrengthsAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Trusting Your Decisions.png",
                  title: "Trusting Your Decisions",
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
                      "assets/images/affermations icons/Speaking with Confidence.png",
                  title: "Speaking with Confidence",
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
                      "assets/images/affermations icons/Overcoming Self-Doubt.png",
                  title: "Overcoming Self-Doubt",
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
                      "assets/images/affermations icons/Believing in Your Potential.png",
                  title: "Believing in Your Potential",
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
                      "assets/images/affermations icons/Radiating Self-Assurance.png",
                  title: "Radiating Self-Assurance",
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
            "Gratitude & Positivity",
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
                      "assets/images/affermations icons/Appreciating the Present Moment.png",
                  title: "Appreciating the Present Moment",
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
                      "assets/images/affermations icons/Finding Joy in Small Things.png",
                  title: "Finding Joy in Small Things",
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
                      "assets/images/affermations icons/Expressing Thankfulness Daily.png",
                  title: "Expressing Thankfulness Daily",
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
                      "assets/images/affermations icons/Cultivating a Positive Mindset.png",
                  title: "Cultivating a Positive Mindset",
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
                      "assets/images/affermations icons/Spreading Happiness & Kindness.png",
                  title: "Spreading Happiness & Kindness",
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
                      "assets/images/affermations icons/Living with Gratitude & Faith.png",
                  title: "Living with Gratitude & Faith",
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
            "Success & Growth Mindset",
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
                      "assets/images/affermations icons/Setting & Achieving Goals.png",
                  title: "Setting & Achieving Goals",
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
                      "assets/images/affermations icons/Learning from Failures.png",
                  title: "Learning from Failures",
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
                      "assets/images/affermations icons/Staying Committed to Growth.png",
                  title: "Staying Committed to Growth",
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
                      "assets/images/affermations icons/Adapting to Challenges.png",
                  title: "Adapting to Challenges",
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
                      "assets/images/affermations icons/Dreaming Big & Taking Action.png",
                  title: "Dreaming Big & Taking Action",
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
                      "assets/images/affermations icons/Attracting Opportunities & Prosperity.png",
                  title: "Attracting Opportunities & Prosperity",
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
            "Inner Peace & Well-Being",
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
                      "assets/images/affermations icons/Living in Harmony with Yourself.png",
                  title: "Living in Harmony with Yourself",
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
                      "assets/images/affermations icons/Overcoming Stress & Anxiety.png",
                  title: "Overcoming Stress & Anxiety",
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
                      "assets/images/affermations icons/Prioritizing Rest & Self-Care.png",
                  title: "Prioritizing Rest & Self-Care",
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
                      "assets/images/affermations icons/Nurturing Emotional Balance.png",
                  title: "Nurturing Emotional Balance",
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
                      "assets/images/affermations icons/Practicing Mindfulness Daily.png",
                  title: "Practicing Mindfulness Daily",
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
                      "assets/images/affermations icons/Letting Go of Negativity.png",
                  title: "Letting Go of Negativity",
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
