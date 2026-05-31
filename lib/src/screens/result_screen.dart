import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlagiarismResultsScreen extends StatelessWidget {
  final String userText;
  final List<Map<String, dynamic>> matches;
  final bool plagiarismDetected;

  const PlagiarismResultsScreen({
    super.key,
    required this.userText,
    required this.matches,
    required this.plagiarismDetected,
  });

  // Method to launch URL in a web browser
  void _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not launch the URL: $url',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  double _calculatePlagiarismPercentage() {
    if (matches.isEmpty) return 0.0;

    // Sum up the lengths of all matched snippets
    int totalMatchLength = 0;
    for (var match in matches) {
      if (match['reference_snippet'] != null &&
          match['reference_snippet'] is String) {
        totalMatchLength += (match['reference_snippet'] as String).length;
      }
    }

    // Calculate the percentage based on the length of the matches and the user's text
    double plagiarismPercentage = (totalMatchLength / userText.length) * 100;

    return plagiarismPercentage;
  }

  @override
  Widget build(BuildContext context) {
    double plagiarismPercentage = _calculatePlagiarismPercentage();

    return Scaffold(
      appBar: AppBar(
        title: Text("Plagiarism Results", style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Text:",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10),
              Text(
                userText,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              Text(
                "Plagiarism Results:",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
              Text(
                plagiarismDetected
                    ? "Plagiarism detected in the submitted text."
                    : "No plagiarism detected.",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: plagiarismDetected
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 13),
              if (plagiarismDetected)
                Text(
                  "Plagiarism Percentage: ${plagiarismPercentage.toStringAsFixed(2)}%",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              const SizedBox(height: 15),
              plagiarismDetected
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: matches.map((match) {
                        String link = match['link'] ?? '';
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (link.isNotEmpty && link != 'No link available') {
                                    _launchURL(context, link);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'No source link available.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainerHighest,
                                      ),
                                    );
                                  }
                                },
                                style: TextButton.styleFrom(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                                ),
                                child: Text(
                                  link.isNotEmpty && link != 'No link available'
                                      ? "View Source"
                                      : "No link available",
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  : Text(
                      "No matches found.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
