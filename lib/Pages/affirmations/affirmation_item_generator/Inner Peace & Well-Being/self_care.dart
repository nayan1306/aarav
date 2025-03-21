import '../affirmation_randomizer.dart';

/// **Bouncing Back from Failure Quotes & Images**
final List<String> selfcareAffirmationRaw = [
  "I release all negative thoughts and welcome positivity.",
  "I let go of what no longer serves me.",
  "I choose peace over worry.",
  "I am free from the weight of negativity.",
  "I release anger and embrace forgiveness.",
  "I let go of resentment and welcome love.",
  "I choose to focus on the good in my life.",
  "I release doubt and trust in myself.",
  "I free myself from past mistakes.",
  "I release the need for control and embrace the flow of life.",
  "I choose to see challenges as opportunities for growth.",
  "I let go of self-judgment and practice self-compassion.",
  "I forgive myself for past decisions.",
  "I release the fear of failure and step into my power.",
  "I am worthy of love, happiness, and peace.",
  "I let go of stress and embrace relaxation.",
  "I detach from negativity and surround myself with positivity.",
  "I release the fear of the unknown and trust my journey.",
  "I free myself from toxic relationships.",
  "I choose love over fear.",
  "I release the habit of overthinking.",
  "I am not defined by my past.",
  "I let go of comparisons and embrace my uniqueness.",
  "I release guilt and embrace self-acceptance.",
  "I choose to live in the present moment.",
  "I release feelings of unworthiness and embrace confidence.",
  "I am free from negative self-talk.",
  "I detach from energy that does not uplift me.",
  "I release worry and embrace inner peace.",
  "I am in control of my emotions.",
  "I let go of the need for approval.",
  "I release self-doubt and step into my power.",
  "I trust that everything is unfolding as it should.",
  "I am not my mistakes, and I choose to move forward.",
  "I release any fear holding me back.",
  "I replace worry with faith.",
  "I let go of limiting beliefs.",
  "I am free from the burden of expectations.",
  "I let go of negative habits and replace them with healthy ones.",
  "I choose positivity and joy every day.",
  "I release bitterness and welcome peace.",
  "I let go of past disappointments.",
  "I forgive and release with ease.",
  "I choose thoughts that empower me.",
  "I am free from negativity in all forms.",
  "I embrace change and let go of resistance.",
  "I release judgment and welcome understanding.",
  "I let go of toxic energy and invite healing.",
  "I am open to new, positive experiences.",
  "I let go of emotional pain and choose joy.",
  "I am grateful for every lesson life teaches me.",
  "I release old wounds and allow myself to heal.",
  "I release past regrets and embrace the present.",
  "I let go of impatience and trust the timing of my life.",
  "I free myself from self-sabotage.",
  "I release the belief that I am not good enough.",
  "I replace negativity with gratitude.",
  "I am in charge of my emotions and reactions.",
  "I choose to see the good in others.",
  "I let go of fears that hold me back.",
  "I free myself from perfectionism.",
  "I release any feelings of being stuck.",
  "I let go of tension and welcome relaxation.",
  "I allow myself to move forward with ease.",
  "I am no longer bound by past hurt.",
  "I release criticism and embrace kindness.",
  "I choose happiness in this moment.",
  "I let go of pain and allow healing.",
  "I release attachment to things I cannot change.",
  "I let go of self-blame and embrace self-love.",
  "I detach from negativity and embrace peace.",
  "I let go of anxiety and choose trust.",
  "I free myself from overanalyzing everything.",
  "I release negativity and embrace abundance.",
  "I choose harmony over conflict.",
  "I replace fear with love.",
  "I am capable of overcoming any challenge.",
  "I release worry and invite peace.",
  "I free myself from toxic thinking patterns.",
  "I am surrounded by positive energy.",
  "I trust in my ability to navigate life.",
  "I let go of emotional burdens.",
  "I release the need to prove myself to others.",
  "I choose to be light and free.",
  "I let go of negative influences.",
  "I am free from past trauma.",
  "I choose faith over fear.",
  "I am in control of my own happiness.",
  "I release the weight of the past.",
  "I forgive those who have hurt me.",
  "I let go of unrealistic expectations.",
  "I allow myself to feel inner peace.",
  "I release insecurities and embrace self-confidence.",
  "I choose kindness over negativity.",
  "I let go of worry and embrace trust.",
  "I free myself from anger and embrace joy.",
  "I trust that I am exactly where I need to be.",
  "I replace doubt with certainty.",
  "I let go of stress and embrace serenity.",
  "I am not defined by negative experiences.",
  "I release the need to control everything.",
  "I am surrounded by love and positivity.",
  "I let go of emotional pain and choose inner joy.",
  "I am strong enough to release what no longer serves me.",
  "I choose to see life through a lens of gratitude.",
  "I trust that better things are coming my way.",
  "I release pain and welcome healing.",
  "I am at peace with where I am.",
  "I free myself from self-imposed limitations.",
  "I let go of negative thoughts that do not serve me.",
  "I am filled with love, light, and joy.",
  "I choose to rise above negativity.",
  "I let go of feelings of helplessness.",
  "I release the past and embrace the future.",
  "I am grateful for the lessons I've learned.",
  "I let go of my worries and trust the process.",
  "I free myself from old patterns that no longer serve me.",
  "I am no longer a prisoner of my past emotions.",
  "I release the fear of judgment.",
  "I replace negative energy with peace.",
  "I let go of things beyond my control.",
  "I am open to receiving love and happiness.",
  "I release self-imposed pressure and embrace self-acceptance.",
  "I free my mind from clutter and negativity.",
  "I let go of any bitterness in my heart.",
  "I release all fear and choose courage.",
  "I let go of past mistakes and forgive myself.",
  "I trust that I am on the right path.",
  "I choose peace over anger.",
  "I let go of negative emotions and welcome joy.",
  "I release all that no longer aligns with my highest good.",
  "I choose to nourish my mind with positivity.",
  "I let go of fear and allow faith to guide me.",
  "I free myself from negative cycles.",
  "I release negativity and embrace clarity.",
  "I am light, I am love, I am free.",
  "I am free from negative energy.",
  "I release all doubt and welcome peace.",
  "I let go of resentment and embrace forgiveness.",
  "I am in control of my thoughts and emotions.",
  "I choose to focus on the good in every situation.",
  "I release fear and replace it with confidence.",
  "I free myself from self-doubt and trust my journey.",
  "I let go of past hurts and welcome healing.",
  "I detach from negativity and embrace inner calm.",
  "I choose to rise above negativity.",
  "I release the need for approval from others.",
  "I am worthy of love, happiness, and success.",
  "I let go of anger and replace it with peace.",
  "I free myself from the burden of stress.",
  "I release toxic thoughts and replace them with positivity.",
  "I am strong enough to release what no longer serves me.",
  "I forgive myself and others with ease.",
  "I let go of worry and embrace faith in the future.",
  "I choose harmony and balance in my life.",
  "I am surrounded by positive energy.",
  "I release self-criticism and embrace self-love.",
  "I free my mind from negative chatter.",
  "I let go of expectations and accept life as it is.",
  "I release the past and welcome new beginnings.",
  "I choose to see the beauty in every day.",
  "I replace stress with relaxation and clarity.",
  "I am no longer weighed down by negativity.",
  "I release all limiting beliefs.",
  "I let go of fear and step into courage.",
  "I free myself from self-imposed pressure.",
  "I replace negativity with gratitude.",
  "I trust that everything is unfolding for my highest good.",
  "I let go of the need to control everything.",
  "I release any thoughts that do not serve me.",
  "I choose to focus on love and positivity.",
  "I am in control of my happiness.",
  "I let go of negative habits and embrace positive change.",
  "I release attachment to things I cannot change.",
  "I free myself from toxic relationships.",
  "I replace anger with understanding.",
  "I let go of emotional burdens that weigh me down.",
  "I welcome peace and clarity into my life.",
  "I release all feelings of unworthiness.",
  "I am worthy of a joyful and fulfilling life.",
  "I let go of negative influences in my life.",
  "I am strong, resilient, and free from negativity.",
  "I release judgment and embrace acceptance.",
  "I let go of grudges and welcome inner peace.",
  "I replace fear with excitement for the future.",
  "I choose to be kind to myself and others.",
  "I let go of comparison and embrace my uniqueness.",
  "I free myself from anxiety and choose calmness.",
  "I trust in my ability to overcome challenges.",
  "I release tension and allow relaxation.",
  "I let go of the need to be perfect.",
  "I am open to new and positive experiences.",
  "I replace overthinking with trust and flow.",
  "I choose to see obstacles as opportunities.",
  "I am no longer bound by my past mistakes.",
  "I release self-doubt and embrace self-confidence.",
  "I free myself from stress and embrace peace.",
  "I let go of guilt and welcome self-compassion.",
  "I choose joy in every moment.",
  "I release past disappointments and welcome hope.",
  "I am in control of my reactions and emotions.",
  "I release tension and allow my body to relax.",
  "I let go of all thoughts that drain me.",
  "I free myself from unnecessary worries.",
  "I choose to focus on solutions, not problems.",
  "I release frustration and welcome patience.",
  "I let go of fears and step into my power.",
  "I detach from drama and embrace serenity.",
  "I am no longer a prisoner of my negative thoughts.",
  "I release feelings of being stuck and embrace progress.",
  "I replace negative self-talk with words of encouragement.",
  "I choose to nourish my soul with love and kindness.",
  "I let go of emotional baggage and travel light.",
  "I am at peace with myself and my past.",
  "I release resistance and welcome flow.",
  "I let go of anything that dims my inner light.",
  "I trust in the process of life.",
  "I release any feelings of lack and embrace abundance.",
  "I let go of the fear of judgment.",
  "I replace doubt with certainty in my abilities.",
  "I choose happiness over negativity.",
  "I let go of emotional pain and choose healing.",
  "I am strong enough to release negativity and move forward.",
  "I replace worry with faith in myself and my journey.",
  "I am worthy of a life filled with love and positivity.",
  "I let go of negative patterns and embrace change.",
  "I choose peace over conflict.",
  "I release stress and allow my body to heal.",
  "I am free from all forms of negativity.",
  "I replace limiting thoughts with empowering beliefs.",
  "I let go of what I cannot control and focus on what I can.",
  "I allow myself to move forward with ease.",
  "I release past wounds and allow love to enter my heart.",
  "I let go of negative emotions and embrace joy.",
  "I choose to shine my light and uplift others.",
  "I trust that I am exactly where I need to be.",
  "I release all fear and welcome confidence.",
  "I am strong, peaceful, and free.",
];

final List<String> selfcareImages = [
  "assets/images/affermations icons/bg/1.jpg",
  "assets/images/affermations icons/bg/2.jpg",
  "assets/images/affermations icons/bg/3.jpg",
  "assets/images/affermations icons/bg/4.jpg",
  "assets/images/affermations icons/bg/5.jpg",
  "assets/images/affermations icons/bg/6.jpg",
  "assets/images/affermations icons/bg/7.jpg",
  "assets/images/affermations icons/bg/8.jpg",
  "assets/images/affermations icons/bg/9.jpg",
  "assets/images/affermations icons/bg/10.jpg",
  "assets/images/affermations icons/bg/11.jpg",
  "assets/images/affermations icons/bg/12.jpg",
  "assets/images/affermations icons/bg/13.jpg",
  "assets/images/affermations icons/bg/14.jpg",
  "assets/images/affermations icons/bg/15.jpg",
  "assets/images/affermations icons/bg/16.jpg",
  "assets/images/affermations icons/bg/17.jpg",
  "assets/images/affermations icons/bg/18.jpg",
  "assets/images/affermations icons/bg/19.jpg",
  "assets/images/affermations icons/bg/20.jpg",
  "assets/images/affermations icons/bg/21.jpg",
  "assets/images/affermations icons/bg/22.jpg",
  "assets/images/affermations icons/bg/23.jpg",
  "assets/images/affermations icons/bg/24.jpg",
  "assets/images/affermations icons/bg/25.jpg",
  "assets/images/affermations icons/bg/26.jpg",
  "assets/images/affermations icons/bg/27.jpg",
  "assets/images/affermations icons/bg/28.jpg",
  "assets/images/affermations icons/bg/29.jpg",
  "assets/images/affermations icons/bg/30.jpg",
  "assets/images/affermations icons/bg/31.jpg",
  "assets/images/affermations icons/bg/32.jpg",
  "assets/images/affermations icons/bg/33.jpg",
  "assets/images/affermations icons/bg/34.jpg",
  "assets/images/affermations icons/bg/35.jpg",
  "assets/images/affermations icons/bg/36.jpg",
  "assets/images/affermations icons/bg/37.jpg",
  "assets/images/affermations icons/bg/38.jpg",
  "assets/images/affermations icons/bg/39.jpg",
  "assets/images/affermations icons/bg/40.jpg",
  "assets/images/affermations icons/bg/41.jpg",
  "assets/images/affermations icons/bg/42.jpg",
  "assets/images/affermations icons/bg/43.jpg",
  "assets/images/affermations icons/bg/44.jpg",
  "assets/images/affermations icons/bg/45.jpg",
  "assets/images/affermations icons/bg/46.jpg",
  "assets/images/affermations icons/bg/47.jpg",
  "assets/images/affermations icons/bg/48.jpg",
  "assets/images/affermations icons/bg/49.jpg",
  "assets/images/affermations icons/bg/50.jpg",
  "assets/images/affermations icons/bg/51.jpg",
  "assets/images/affermations icons/bg/52.jpg",
  "assets/images/affermations icons/bg/53.jpg",
  "assets/images/affermations icons/bg/54.jpg",
  "assets/images/affermations icons/bg/55.jpg",
  "assets/images/affermations icons/bg/56.jpg",
  "assets/images/affermations icons/bg/57.jpg",
  "assets/images/affermations icons/bg/58.jpg",
  "assets/images/affermations icons/bg/59.jpg",
  "assets/images/affermations icons/bg/60.jpg",
  "assets/images/affermations icons/bg/61.jpg",
  "assets/images/affermations icons/bg/62.jpg",
  "assets/images/affermations icons/bg/63.jpg",
  "assets/images/affermations icons/bg/64.jpg",
  "assets/images/affermations icons/bg/65.jpg",
  "assets/images/affermations icons/bg/66.jpg",
  "assets/images/affermations icons/bg/67.jpg",
  "assets/images/affermations icons/bg/68.jpg",
  "assets/images/affermations icons/bg/69.jpg",
  "assets/images/affermations icons/bg/70.jpg",
  "assets/images/affermations icons/bg/71.jpg",
  "assets/images/affermations icons/bg/72.jpg",
  "assets/images/affermations icons/bg/73.jpg",
  "assets/images/affermations icons/bg/74.jpg",
  "assets/images/affermations icons/bg/75.jpg",
  "assets/images/affermations icons/bg/76.jpg",
  "assets/images/affermations icons/bg/77.jpg",
  "assets/images/affermations icons/bg/78.jpg",
  "assets/images/affermations icons/bg/79.jpg",
  "assets/images/affermations icons/bg/80.jpg",
  "assets/images/affermations icons/bg/81.jpg",
  "assets/images/affermations icons/bg/82.jpg",
  "assets/images/affermations icons/bg/83.jpg",
  "assets/images/affermations icons/bg/84.jpg",
  "assets/images/affermations icons/bg/85.jpg",
  "assets/images/affermations icons/bg/86.jpg",
  "assets/images/affermations icons/bg/87.jpg",
  "assets/images/affermations icons/bg/88.jpg",
  "assets/images/affermations icons/bg/89.jpg",
  "assets/images/affermations icons/bg/90.jpg",
  "assets/images/affermations icons/bg/91.jpg",
  "assets/images/affermations icons/bg/92.jpg",
  "assets/images/affermations icons/bg/93.jpg",
  "assets/images/affermations icons/bg/94.jpg",
  "assets/images/affermations icons/bg/95.jpg",
  "assets/images/affermations icons/bg/96.jpg",
  "assets/images/affermations icons/bg/97.jpg",
  "assets/images/affermations icons/bg/98.jpg",
  "assets/images/affermations icons/bg/99.jpg",
  "assets/images/affermations icons/bg/100.jpg",
];

/// Generate the final list of shuffled bounce back quotes with random images.
final List<AffirmationItem> selfcareAffirmation = getShuffledaffirmations(
  selfcareAffirmationRaw,
  selfcareImages,
);
