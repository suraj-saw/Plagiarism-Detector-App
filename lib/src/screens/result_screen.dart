import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PlagiarismResultsScreen extends StatelessWidget {
  final String userText;
  final List<Map<String, dynamic>> matches;
  final bool plagiarismDetected;
  // ── FIX 4: Accept plagiarismPercentage from backend instead of
  //           recalculating it locally (old calc used snippet lengths
  //           which gave wildly inaccurate numbers) ─────────────────────────
  final double plagiarismPercentage;

  const PlagiarismResultsScreen({
    super.key,
    required this.userText,
    required this.matches,
    required this.plagiarismDetected,
    required this.plagiarismPercentage, // ← new required param
  });

  Future<void> _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Could not launch: $url',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  // ── Colour-codes the percentage badge ─────────────────────────────────────
  Color _percentageColor(BuildContext context) {
    if (plagiarismPercentage < 20) return Colors.green.shade600;
    if (plagiarismPercentage < 50) return Colors.orange.shade700;
    return Theme.of(context).colorScheme.error;
  }

  String _verdictLabel() {
    if (plagiarismPercentage < 20) return 'Mostly Original';
    if (plagiarismPercentage < 50) return 'Moderate Plagiarism';
    return 'High Plagiarism';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plagiarism Results',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Summary card ─────────────────────────────────────────────
            _SummaryCard(
              plagiarismDetected: plagiarismDetected,
              plagiarismPercentage: plagiarismPercentage,
              percentageColor: _percentageColor(context),
              verdictLabel: _verdictLabel(),
              sourceCount: matches.length,
            ),

            const SizedBox(height: 20),

            // ── Submitted text ────────────────────────────────────────────
            Text(
              'Your Text:',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                userText,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height: 24),

            // ── Matched sources ────────────────────────────────────────────
            if (plagiarismDetected) ...[
              Text(
                // ── FIX 5: matches are already deduplicated in controller ──
                'Matched Sources (${matches.length}):',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
              ...matches.map((match) => _SourceCard(
                    match: match,
                    onLaunch: (url) => _launchURL(context, url),
                    context: context,
                  )),
            ] else ...[
              Text(
                'No plagiarism detected.',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your text appears to be original.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Summary card widget ──────────────────────────────────────────────────────
class _SummaryCard extends StatelessWidget {
  final bool plagiarismDetected;
  final double plagiarismPercentage;
  final Color percentageColor;
  final String verdictLabel;
  final int sourceCount;

  const _SummaryCard({
    required this.plagiarismDetected,
    required this.plagiarismPercentage,
    required this.percentageColor,
    required this.verdictLabel,
    required this.sourceCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Circular percentage indicator
            SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: (plagiarismPercentage / 100).clamp(0.0, 1.0),
                    strokeWidth: 8,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(percentageColor),
                  ),
                  Center(
                    child: Text(
                      '${plagiarismPercentage.toStringAsFixed(1)}%',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: percentageColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Verdict text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    verdictLabel,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: percentageColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    plagiarismDetected
                        ? '$sourceCount unique source(s) matched'
                        : 'Your text appears original',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Individual source card ───────────────────────────────────────────────────
class _SourceCard extends StatelessWidget {
  final Map<String, dynamic> match;
  final void Function(String url) onLaunch;
  final BuildContext context;

  const _SourceCard({
    required this.match,
    required this.onLaunch,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final String link = match['link'] as String? ?? '';
    final String snippet = match['reference_snippet'] as String? ?? '';
    final String ngram = match['ngram'] as String? ?? '';
    final bool hasLink =
        link.isNotEmpty && link != 'No link available';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Matched phrase chip
            if (ngram.isNotEmpty) ...[
              Wrap(
                children: [
                  Chip(
                    label: Text(
                      'Matched: "$ngram"',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    backgroundColor:
                        Theme.of(context).colorScheme.errorContainer,
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              const SizedBox(height: 6),
            ],
            // Snippet preview
            if (snippet.isNotEmpty) ...[
              Text(
                snippet.length > 200
                    ? '${snippet.substring(0, 200)}…'
                    : snippet,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const SizedBox(height: 8),
            ],
            // Source link button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: hasLink
                    ? () => onLaunch(link)
                    : () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'No source link available.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                icon: Icon(
                  hasLink ? Icons.open_in_new : Icons.link_off,
                  size: 16,
                ),
                label: Text(hasLink ? 'View Source' : 'No Link Available'),
                style: TextButton.styleFrom(
                  foregroundColor: hasLink
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}