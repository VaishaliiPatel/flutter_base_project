import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';

class AppTextSpan extends BaseStatelessWidget {
  const AppTextSpan({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.infoTextStyle,
    required this.navigationTextStyle,
  }): super(key: key);

  final String title;
  final String subTitle;
  final TextStyle infoTextStyle;
  final TextStyle navigationTextStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      /// Register text
      TextSpan(
        text: title,
        style: infoTextStyle,
        children: <InlineSpan>[
          /// Register Navigation button
          TextSpan(
            text: subTitle,
            style: navigationTextStyle,
          )
        ],
      ),
    );
  }
}
