import 'package:aarav/Pages/quote/quote_final_landing.dart';
import 'package:flutter/material.dart';
import 'affirmation_item_generator/affirmation_randomizer.dart';

class AffirmationViewer extends StatefulWidget {
  final List<String> quotes;
  final List<String> imagePaths;

  const AffirmationViewer({
    super.key,
    required this.quotes,
    required this.imagePaths,
  });

  /// Named constructor that accepts a list of QuoteItem key‑value pairs.
  AffirmationViewer.fromItems({super.key, required List<AffirmationItem> items})
    : quotes = items.map((item) => item.affirmation).toList(),
      imagePaths = items.map((item) => item.imagePath).toList();

  @override
  State<AffirmationViewer> createState() => _AffirmationViewerState();
}

class _AffirmationViewerState extends State<AffirmationViewer> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.quotes.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return QuoteFinalLanding(
            key: ValueKey(index),
            quote: widget.quotes[index],
            imagePath: widget.imagePaths[index],
            isActive: currentPage == index,
          );
        },
      ),
    );
  }
}
