import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'my_special_text_span_builder.dart';

class DollarText extends SpecialText {
  static const String flag = "\$";
  final int start;
  final BuilderType type;
  DollarText(TextStyle textStyle, SpecialTextGestureTapCallback onTap,
      {this.type, this.start})
      : super(flag, flag, textStyle, onTap: onTap);

  @override
  TextSpan finishText() {
    // TODO: implement finishText
    final String text = getContent();

    if (type == BuilderType.extendedText)
      return TextSpan(
          text: text,
          style: textStyle?.copyWith(color: Colors.orange),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (onTap != null) onTap(toString());
            });

    return SpecialTextSpan(
      text: text,
      actualText: toString(),
      start: start,
      deleteAll: true,
      style: textStyle?.copyWith(color: Colors.orange),
    );
  }
}

List<String> dollarList = <String>[
  "\$Dota2\$",
  "\$Dota2 Ti9\$",
  "\$CN dota best dota\$",
  "\$Flutter\$",
  "\$CN dev best dev\$",
  "\$UWP\$",
  "\$Nevermore\$",
  "\$FlutterCandies\$",
  "\$ExtendedImage\$",
  "\$ExtendedText\$",
];
