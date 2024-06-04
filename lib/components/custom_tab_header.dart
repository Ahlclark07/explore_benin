import 'package:flutter/material.dart';

class CustomTabHeader extends StatelessWidget {
  final String value;
  final bool actif;
  const CustomTabHeader({super.key, required this.value, required this.actif});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: actif ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(7)),
      child: Text(value),
    );
  }
}
