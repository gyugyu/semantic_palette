library semantic_palette;

import 'dart:ui' show Color;
import 'package:flutter/material.dart' show MaterialAccentColor, MaterialColor;
import 'package:meta/meta.dart';
import 'package:tuple/tuple.dart';

enum ColorType { PRIMARY, ACCENT }
enum ColorName {
  GRAY,
  BLUE,
  SKY,
  GRAPE,
  RED,
  ORANGE,
  YELLOW,
  LEAF,
  GREEN,
}

const _transparent = Color(0x00000000);
const _black = Color(0xFF000000);
const _white = Color(0xFFFFFFFF);

class Palette {
  final Map<String, Tuple3<ColorType, ColorName, int>> keyConversionTable;
  final Map<ColorName, MaterialColor> primaries;
  final Map<ColorName, MaterialAccentColor> accents;
  final Color transparent;
  final Color black;
  final Color white;

  const Palette({
    @required this.keyConversionTable,
    @required this.primaries,
    @required this.accents,
    this.transparent = _transparent,
    this.black = _black,
    this.white = _white,
  });

  Palette.fromColorLike({
    @required this.keyConversionTable,
    @required this.primaries,
    @required this.accents,
    @required dynamic colorLike,
  })  : transparent = colorLike.transparent,
        black = colorLike.black,
        white = colorLike.white;

  Color get info => _findColor('info');

  Color _findColor(final String name) {
    final conversion = keyConversionTable[name];
    Color color;
    switch (conversion.item1) {
      case ColorType.PRIMARY:
        color = primaries[conversion.item2][conversion.item3];
        break;
      case ColorType.ACCENT:
        color = accents[conversion.item2][conversion.item3];
        break;
    }
    return color;
  }
}
