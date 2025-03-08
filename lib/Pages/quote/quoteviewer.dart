import 'package:aarav/Pages/quote/quote_final_landing.dart';
import 'package:flutter/material.dart';
import 'quotes_collection.dart';

class QuoteViewer extends StatefulWidget {
  final List<String> quotes;
  final List<String> imagePaths;

  const QuoteViewer({
    super.key,
    required this.quotes,
    required this.imagePaths,
  });

  /// Named constructor that accepts a list of QuoteItem key‑value pairs.
  QuoteViewer.fromItems({super.key, required List<QuoteItem> items})
    : quotes = items.map((item) => item.quote).toList(),
      imagePaths = items.map((item) => item.imagePath).toList();

  @override
  State<QuoteViewer> createState() => _QuoteViewerState();
}

class _QuoteViewerState extends State<QuoteViewer> {
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
