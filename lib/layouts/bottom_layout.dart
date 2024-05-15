import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_responsive_ui/core/core_export.dart';

class BottomLayout extends StatelessWidget {
  // final HomeBottomResponseModel bottom;

  const BottomLayout({
    super.key,
    // required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Center(
        child: MarkdownBody(
          data:
              "Created with ♥ by [@Wodatoki](https://www.linkedin.com/in/wodatoki/) using [Flutter & Clean Arch]()",
          onTapLink: (text, href, title) => _onTapLink(href),
          styleSheet: MarkdownStyleSheet(
            textAlign: WrapAlignment.center,
          ),
        ),
      ),
    );
  }

  void _onTapLink(String? href) {
    LaunchUtil.launchWeb(href);
  }
}
