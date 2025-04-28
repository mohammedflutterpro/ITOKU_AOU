import 'package:flutter/material.dart';

class SuggestedFeaturesPage extends StatefulWidget {
  @override
  _SuggestedFeaturesPageState createState() => _SuggestedFeaturesPageState();
}

class _SuggestedFeaturesPageState extends State<SuggestedFeaturesPage> {
  final TextEditingController _suggestionController = TextEditingController();
  String _confirmationMessage = '';

  void _submitSuggestion() {
    if (_suggestionController.text.trim().isEmpty) {
      setState(() {
        _confirmationMessage = 'Please enter a suggestion.';
      });
      return;
    }

    // You can handle saving/sending here
    setState(() {
      _confirmationMessage = 'Thank you for your suggestion!';
      _suggestionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Features'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Let us know what features you’d like to see in the future!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _suggestionController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your suggestion here...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitSuggestion,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 10),
            if (_confirmationMessage.isNotEmpty)
              Text(
                _confirmationMessage,
                style: TextStyle(
                  color: _confirmationMessage.contains('Thank')
                      ? Colors.green
                      : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
