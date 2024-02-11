import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieReviewWidget extends StatefulWidget {
  final String movieTitle;

  MovieReviewWidget({required this.movieTitle});

  @override
  _MovieReviewWidgetState createState() => _MovieReviewWidgetState();
}

class _MovieReviewWidgetState extends State<MovieReviewWidget> {
  final TextEditingController _reviewController = TextEditingController();
  List<String> reviews = [];

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      reviews = prefs.getStringList(widget.movieTitle) ?? [];
    });
  }

  Future<void> _saveReview() async {
    if (_reviewController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      reviews.add(_reviewController.text);
      await prefs.setStringList(widget.movieTitle, reviews);
      _reviewController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _reviewController,
            decoration: const InputDecoration(
              labelText: 'Write a review...',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _saveReview,
          child: const Text('Submit Review'),
        ),
        const SizedBox(height: 20),
        if (reviews.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'User Reviews:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              for (String review in reviews)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('> $review'),
                ),
            ],
          ),
      ],
    );
  }
}
