import 'package:flutter/material.dart';

class LowPadding extends EdgeInsets {
  const LowPadding.all() : super.all(4.0);
}

class NormalPadding extends EdgeInsets {
  const NormalPadding.all() : super.all(8.0);
}

class HighPadding extends EdgeInsets {
  const HighPadding.all() : super.all(20.0);
}

class ListviewPadding extends EdgeInsets {
  const ListviewPadding.all() : super.symmetric(horizontal: 20, vertical: 20);
}

class ZodiacSignPadding extends EdgeInsets {
  const ZodiacSignPadding.all() : super.symmetric(horizontal: 10, vertical: 10);
}
