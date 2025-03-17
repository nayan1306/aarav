import 'package:aarav/Pages/affirmations/affirmation_item_generator/Gratitude%20&%20Positivity/cultivate_positivity.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Gratitude%20&%20Positivity/daily_gratitude.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Gratitude%20&%20Positivity/embrace_present.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Gratitude%20&%20Positivity/faith_gratitude.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Gratitude%20&%20Positivity/finding_joy.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Gratitude%20&%20Positivity/spread_happiness.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Inner%20Peace%20&%20Well-Being/balanced_living.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Inner%20Peace%20&%20Well-Being/live_in_harmony.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Inner%20Peace%20&%20Well-Being/overcome_stress.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Inner%20Peace%20&%20Well-Being/practice_mindfulness.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Inner%20Peace%20&%20Well-Being/release_negativity.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Inner%20Peace%20&%20Well-Being/self_care.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Self-Belief%20&%20Confidence/believe_in_potential.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Self-Belief%20&%20Confidence/embracing_strength.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Self-Belief%20&%20Confidence/overcome_doubt.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Self-Belief%20&%20Confidence/radiate_assurance.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Self-Belief%20&%20Confidence/speak_confidently.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Self-Belief%20&%20Confidence/trust_decisions.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Success%20&%20Growth%20Mindset/achieve_goals.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Success%20&%20Growth%20Mindset/adaptability.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Success%20&%20Growth%20Mindset/dream_and_act.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Success%20&%20Growth%20Mindset/growth_commitment.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Success%20&%20Growth%20Mindset/learn_from_failure.dart';
import 'package:aarav/Pages/affirmations/affirmation_item_generator/Success%20&%20Growth%20Mindset/opportunity_magnet.dart';
import 'package:aarav/Pages/affirmations/affirmation_viewer.dart';
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
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Embracing Your Strengths.png",
                  title: "Embrace Strengths",

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
                  title: "Trust Decisions",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: trustdecisionsAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Speaking with Confidence.png",
                  title: "Speak Confidently",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: speakconfidentlyAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Overcoming Self-Doubt.png",
                  title: "Overcome Doubt",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: overcomedoubtAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Believing in Your Potential.png",
                  title: "Believe in Potential",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: believeinpotentialAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Radiating Self-Assurance.png",
                  title: "Radiate Assurance",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: radiateassuranceAffirmation,
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
                  title: "Embrace Present",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: embracepresentAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Finding Joy in Small Things.png",
                  title: "Finding Joy",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: findingjoyAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Expressing Thankfulness Daily.png",
                  title: "Daily Gratitude",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: dailygratitudeAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Cultivating a Positive Mindset.png",
                  title: "Cultivate Positivity",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: cultivatepositivityAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Spreading Happiness & Kindness.png",
                  title: "Spread Happiness",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: spreadhappinessAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Living with Gratitude & Faith.png",
                  title: "Faith & Gratitude",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: faithgratitudeAffirmation,
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
                  title: "Achieve Goals",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: achievegoalsAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Learning from Failures.png",
                  title: "Learn from Failure",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: learnfromfailureAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Staying Committed to Growth.png",
                  title: "Growth Commitment",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: growthcommitmentAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Adapting to Challenges.png",
                  title: "Adaptability",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: adaptabilityAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Dreaming Big & Taking Action.png",
                  title: "Dream & Act",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: dreamactAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Attracting Opportunities & Prosperity.png",
                  title: "Opportunity Magnet",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: opportunitymagnetAffirmation,
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
                  title: "Live in Harmony",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: liveharmonyAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Overcoming Stress & Anxiety.png",
                  title: "Overcome Stress",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: overcomestressAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Prioritizing Rest & Self-Care.png",
                  title: "Self-Care",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: selfcareAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Nurturing Emotional Balance.png",
                  title: "Balanced Living",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: balancedlivingAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Practicing Mindfulness Daily.png",
                  title: "Practice Mindfulness",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: practicemindfulnessAffirmation,
                            ),
                      ),
                    );
                  },
                ),
                QuoteTile(
                  assetImagePath:
                      "assets/images/affermations icons/Letting Go of Negativity.png",
                  title: "Release Negativity",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AffirmationViewer.fromItems(
                              items: releasenegativityAffirmation,
                            ),
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
