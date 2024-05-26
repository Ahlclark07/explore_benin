import 'package:explore_benin/theme/palette.dart';
import 'package:flutter/material.dart';

class ContainerDecoration {
  static const BoxDecoration roundedYellow =
      BoxDecoration(color: Palette.primary, shape: BoxShape.circle, boxShadow: [
    BoxShadow(
      color: Palette.primary,
      offset: Offset(-1, 3),
      blurRadius: 16,
      spreadRadius: 5,
    )
  ]);
}
