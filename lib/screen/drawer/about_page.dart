import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(child: Text("This is the About Page")),
    );
  }
}


class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("How to use")),
      body: Center(child: Text("This is the How to Use Page")),
    );
  }
}



class SavedIDsPage extends StatelessWidget {
  const SavedIDsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saved IDs")),
      body: Center(child: Text("This is the Saved IDs Page")),
    );
  }
}


class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report a problem")),
      body: Center(child: Text("This is the Report a Problem Page")),
    );
  }
}

// feature_request.dart
class FeatureRequestPage extends StatelessWidget {
  const FeatureRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feature Request")),
      body: Center(child: Text("This is the Feature Request Page")),
    );
  }
}

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Donation")),
      body: Center(child: Text("This is the Donation Page")),
    );
  }
}