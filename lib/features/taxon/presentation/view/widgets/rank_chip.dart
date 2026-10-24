import 'package:flutter/material.dart';

class RankChip extends StatelessWidget {
  const RankChip({super.key, required this.label, required this.color, required this.onColor});

  final String label;
  final Color color;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium
              ?.copyWith(color: onColor),
        ),
      ),
    );
  }
}
